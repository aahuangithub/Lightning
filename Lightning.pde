import java.util.*;
List<Integer> startX= new ArrayList<Integer>();
List<Integer> startY= new ArrayList<Integer>();
List<Integer> endX= new ArrayList<Integer>(); 
List<Integer> endY= new ArrayList<Integer>();
//
void setup()
{
  size(900,900);
  background(0);
  startX.add(width/2);
  endX.add(width/2);
  startY.add(width/2);
  endY.add(width/2);
  strokeWeight(2);
  frameRate(20);
  stroke(256, 0, 0);
}
void draw()
{
	background(0);
	while(startX.get(list.size()-1)<width && startX.get(list.size()-1)>0 && !startX.isEmpty()){

		endX.add(endX.getLast()+(int)(Math.random()*71-35));
		endY.add(endY.getLast()+(int)(Math.random()*71-35));
	}
	
	startX.clear();
	startY.clear();
	endX.clear();
	endY.clear();
 	startX.add(mouseX);
 	endX.add(mouseX);
 	startY.add(mouseY);
 	endY.add(mouseY);
 	stroke((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);

}

void mousePressed()
{
//
}

