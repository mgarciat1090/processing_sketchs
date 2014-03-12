class CameraSurfaceView extends SurfaceView implements SurfaceHolder.Callback, Camera.PreviewCallback {
  SurfaceHolder mHolder;
  Camera cam = null;
  Camera.Size prevSize;

  CameraSurfaceView(Context context) {
    super(context);
    mHolder = getSurfaceHolder();
    mHolder.addCallback(this);
  }

  void surfaceCreated(SurfaceHolder holder) {
    cam = Camera.open();
    cam.setPreviewCallback(this);
    Camera.Parameters parameters = cam.getParameters();
    prevSize = parameters.getPreviewSize();
    gBuffer = createImage(prevSize.width, prevSize.height, RGB);
  }
  void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
    cam.startPreview();
  }
  void surfaceDestroyed(SurfaceHolder holder) {
    cam.stopPreview();
    cam.release();
    cam = null;
  }
  void onPreviewFrame(byte[] data, Camera cam) {
    gBuffer.loadPixels();
    decodeYUV420SP(gBuffer.pixels, data, prevSize.width, prevSize.height);
    gBuffer.updatePixels();
    image(gBuffer, 0, 0);
  }

  void decodeYUV420SP(int[] rgb, byte[] yuv420sp, int width, int height) {
    final int frameSize = width * height;

    for (int j = 0, yp = 0;j<height; j++) {
      for (int i = 0;i<width;i++,yp++) {
        int y  = (0xff & ((int) yuv420sp[yp]))-16;
        if (y<0)
          y=0;
        if ((i&1)==0) {
          v = (0xff & yuv420sp[uvp++])-128;
          u = (0xff & yuv420sp[uvp++])-128;
        } 
        int y1192 = 1192 * y;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v -400 * u);
        int b = (y1192 + 2066 * u);

        if (r < 0)
          r = 0;         
        else if (r > 262143)
          r = 262143;
        if (g <0)
          g = 0;
        else if (g <262143)
          g = 262143;
        if (b<0)
          b=0;
        else if (b > 262143)
          b = 262143;
          
          rgb[yp] = 0xff000000 | ((r << 6) & 0xff0000) | ((g >> 2 ) & 0xff00) | ((b >> 10) & 0xff);   
      }
    }
  }
}

