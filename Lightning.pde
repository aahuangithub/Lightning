int startX, startY, endX, endY, finalX, finalY, dX, dY, c;
float xValues[]={0, 0, 0};
float yValues[]={0, 0, 0};
//
void setup()
{
  size(800,800);
  background(0);
  finalX=finalY=startX=startY=endX=endY=width/2;
  noCursor();
  frameRate(30);
  c=-1;
}

void drawTriangles(float x, float y){
	int radius=60;
	int circleSize=30;
	noStroke();
	strokeWeight(1);
	xValues[0]=x;
	xValues[1]=x-radius*0.866;
	xValues[2]=x+radius*0.866;
	yValues[0]=y-radius;
	yValues[1]=y+0.5*radius;
	yValues[2]=y+0.5*radius;

	for (int i=0; i<xValues.length; i++){
		if (i==0){fill(256, 100, 100, 75);}
		else if (i==1){fill(233, 233, 233, 50);}
		else if (i==2){fill(100, 100, 256, 100);}
		ellipse(xValues[i], yValues[i], circleSize, circleSize);
		fill(256,256,256,100);
		ellipse(xValues[i], yValues[i], circleSize*0.33, circleSize*0.33);
	}

	stroke(256, 256, 256, 133);
	fill(0, 0, 0, 88);
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
	finalX+=dX*0.033;
	finalY+=dY*0.033;
	drawTriangles(finalX, finalY);

	for (int i=0; i<xValues.length; i++){
		if (c==-1){
			startX=endX=(int)xValues[i];
			startY=endY=(int)yValues[i];
			//sets colors of the lightning
			if (i==0){stroke(256, 150, 150, 77);}
			else if (i==1){stroke(233, 233, 233, 77);}
			else if (i==2){stroke(100, 100, 233, 77);}
		}
		else if (c!=-1){
			startX=endX=(int)xValues[c];
			startY=endY=(int)yValues[c];
			if (c==0){stroke(256, 150, 150, 77);}
			else if (c==1){stroke(233, 233, 233, 77);}
			else if (c==2){stroke(100, 100, 233, 77);}
		}
		strokeWeight(3);


		//draws lightning
		while(startX<width && startX>0 && endY>0 && endY<width){
			endX+=(int)(Math.random()*71-35);
			endY+=(int)(Math.random()*71-35);
			line(startX, startY, endX, endY);
			startX=endX;
			startY=endY;
		}
	}

	
	//draws cursor
	strokeWeight(2);
	stroke(200, 200, 200, 256);
	line(mouseX-7, mouseY, mouseX+7, mouseY);
	line(mouseX, mouseY-7, mouseX, mouseY+7);
	
	//resets x and y values
	startX=endX=finalX;
	startY=endY=finalY;
 	stroke((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);
}

void mousePressed(){
	if (c==2){
		c=-1;
	}
	else{
		c++;
	}
}
