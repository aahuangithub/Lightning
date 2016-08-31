int startX, startY, endX, endY;

//
void setup()
{
  size(900,900);
  background(0);
  strokeWeight(2);
  stroke(256, 0, 0);
  startX=startY=endX=endY=width/2;
}
void draw()
{
	background(0);
	if(startX<width && startX>0 && endY>0 && endY<width){
		endX+=(int)(Math.random()*71-35);
		endY+=(int)(Math.random()*71-35);
		line(startX, startY, endX, endY);
		startX=endX;
		startY=endY;
	}
	else{
	startX=endX=mouseX;
	startY=endY=mouseY;
 	stroke((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);}

}

void mousePressed()
{
//
}

