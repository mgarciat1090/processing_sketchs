class fibonacci {

  private int actual;
  private int last;
  private double[] fibonacci;

  public double[] generate(int count) {
    actual = 0;
    last = 0;
    fibonacci = new double[count];

    for (int i = 0;i<count; i++) {
      if (i == 1) {
        actual=1;
      }
      else {
        actual=actual+last;
      }
      fibonacci[i] =  actual;
      if (i != 0) {
        last = (int)fibonacci[i-1];
      }
    }
    return fibonacci;
  }
}
