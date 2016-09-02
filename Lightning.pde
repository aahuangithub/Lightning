int startX, startY, endX, endY, finalX, finalY, dX, dY, rotation;
float xValues[]={0, 0, 0};
float yValues[]={0, 0, 0};
//
void setup()
{
  size(800,800);
  background(0);
  strokeWeight(2);
  stroke(256, 0, 0);
  finalX=finalY=startX=startY=endX=endY=width/2;
  rotation=0;
  noCursor();
}
void drawTriangles(float x, float y){
	int radius=60;
	int circleSize=30;
	strokeWeight(1);
	xValues[0]=x;
	xValues[1]=x-radius*0.866;
	xValues[2]=x+radius*0.866;
	yValues[0]=y-radius;
	yValues[1]=y+0.5*radius;
	yValues[2]=y+0.5*radius;

	for (int i=0; i<xValues.length; i++){
		if (i==0){fill(233, 100, 100, 200);}
		else if (i==1){fill(233, 233, 233, 150);}
		else if (i==2){fill(100, 150, 233, 200);}
		ellipse(xValues[i], yValues[i], circleSize, circleSize);
		fill(256,256,256,100);
		ellipse(xValues[i], yValues[i], circleSize*0.33, circleSize*0.33);
	}
	stroke(256, 256, 256, 133);
	fill(0, 0, 0, 55);
	triangle(xValues[0], yValues[0], xValues[1], yValues[1], xValues[2], yValues[2]);
	line(xValues[0], yValues[0], xValues[1], yValues[1]);
	line(xValues[1], yValues[1], xValues[2], yValues[2]);
	line(xValues[2], yValues[2], xValues[0], yValues[0]);
}

void draw()
{
	background(0);
		//code for the triangle
	dX=mouseX-finalX;
	dY=mouseY-finalY;
	finalX+=dX*0.025;
	finalY+=dY*0.025;
	noStroke();
	drawTriangles(finalX, finalY);
	
	for (int i=0; i<xValues.length; i++){
		startX=endX=(int)xValues[i];
		startY=endY=(int)yValues[i];
		stroke(i*50, xValues[i]*0.2, xValues[i]*0.2);
		strokeWeight(10);
		if (i==0){stroke(200, 150, 150, 55);}
		else if (i==1){stroke(233, 233, 233, 55);}
		else if (i==2){stroke(100, 150, 233, 55);}
		while(startX<width && startX>0 && endY>0 && endY<width){
			endX+=(int)(Math.random()*85-42);
			endY+=(int)(Math.random()*85-42);
			line(startX, startY, endX, endY);
			startX=endX;
			startY=endY;
		}
	}
	rotation += PI/9;

	
	//draws cursor
	noStroke();
	fill(256, 256, 256, 100);
	ellipse(mouseX, mouseY, 20, 20);
	
	//resets x and y values
	startX=endX=finalX;
	startY=endY=finalY;
 	stroke((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);

}


