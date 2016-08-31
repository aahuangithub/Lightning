int startX, startY, endX, endY, finalX, finalY, dX, dY;


//
void setup()
{
  size(900,900);
  background(0);
  strokeWeight(2);
  stroke(256, 0, 0);
  finalX=finalY=startX=startY=endX=endY=width/2;

  noCursor();
}
void drawTriangles(float x, float y){
	int radius=60;
	int circleSize=30;

	stroke(256, 256, 256, 256);
	line(x, y-radius, x-radius*0.866, y+0.5*radius);
	line(x-radius*0.866, y+0.5*radius, x+radius*0.866, y+0.5*radius);
	line(x, y-radius, x+radius*0.866, y+0.5*radius);

	fill(256, 256, 256, 150);
	ellipse(x, y-radius, circleSize, circleSize);
	ellipse(x-radius*0.866, y+0.5*radius, circleSize, circleSize);
	ellipse(x+radius*0.866, y+0.5*radius, circleSize, circleSize);
	fill(256,256,256,200);
	ellipse(x, y-radius, circleSize*0.25, circleSize*0.25);
	ellipse(x-radius*0.866, y+0.5*radius, circleSize*0.25, circleSize*0.25);
	ellipse(x+radius*0.866, y+0.5*radius, circleSize*0.25, circleSize*0.25);
}

void draw()
{
	background(0);
	while(startX<width && startX>0 && endY>0 && endY<width){
		endX+=(int)(Math.random()*71-35);
		endY+=(int)(Math.random()*71-35);
		line(startX, startY, endX, endY);
		startX=endX;
		startY=endY;
	}
	
	//code for the triangle
	dX=mouseX-finalX;
	dY=mouseY-finalY;
	finalX+=dX*0.025;
	finalY+=dY*0.025;
	noStroke();
	drawTriangles(finalX, finalY);

	
	//draws cursor
	noStroke();
	fill(256, 256, 256, 150);
	ellipse(mouseX, mouseY, 20, 20);
	
	//resets x and y values
	startX=endX=finalX;
	startY=endY=finalY;
 	stroke((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);

}

void mousePressed()
{
//
}

