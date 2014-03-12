//bargraph function
void bar(int i, int n,int outcome,String label){
  //Calculate the value for the bars
  int x = int(width*i/(n+1)); //calcculate the x coord for each bar
  int spaceBars = 20; //set space between bars in pixels
  float wide = (width - spaceBars * (n+1))/n;
  
  rectMode(CENTER);
  noStroke();
  fill(220,10,10);
  rect(x,height-outcome/2, wide,outcome);
  
  textAlign(CENTER);
  fill(200);
  text(label,x,height-outcome-10);
  fill(0);
  text(outcome,x,height-outcome+20);
  
}
