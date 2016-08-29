int startX, startY, endX, endY;
//
void setup()
{
  size(300,300);

  startX=endX=0;
  startY=endY=150;
  strokeWeight(5);
  
  stroke(127);
}
void draw()
{
	if(startX<300){
		endX+=(int)(Math.random()*5);
		endY+=(int)(Math.random()*11-5);
		line(startX, startY, endX, endY);
	}
	startX=endX;
	startY=endY;
}
void mousePressed()
{
  startX=endX=0;
  startY=endY=150;
  background(0);
}

