float circleX, circleY, circleSize, rectX, rectY, rectSize; 

float circleSpeed, rectSpeed, gravity, circleJump, rectJump;

color circleColor, circleHighlight, rectColor, rectHighlight;
boolean circleOver = false;
boolean rectOver = false;
boolean star= false;

void setup(){
  
  size(500, 500);
background(21,40,152);
  
  circleX= 100;
  circleY= height/2;
  circleSpeed= 0;
  circleSize=100;
  circleJump= -20;
  gravity= 1.0;
  rectSpeed=0;
  rectJump=20;
 
  circleColor= color(0);
  circleHighlight= color(50);
  rectColor= color(255);
  rectHighlight = color(200);
  rectX= 300;
  rectY= (height/2)-50;
  rectSize=100;
  
}


void draw(){
  update(mouseX, mouseY);

  //Circle Button
  background(255);
  if(circleOver){
    fill(circleHighlight);
  } else{
  fill(circleColor);
      }
    ellipse(circleX, circleY, circleSize, circleSize);
    textSize(32);
    text("TAP", 70, (height/2)+100);



// Rectangle button
pushStyle();
if(rectOver){
  fill(rectHighlight);
}else {
  fill(rectColor);
}
rect(rectX, rectY, rectSize, rectSize);
 textSize(32);
 text("TAP", 320, (height/2)+100);
 



//Circle Button movement
circleY= circleY + circleSpeed;
circleSpeed = circleSpeed +gravity;

if (circleY > height/2){
  circleSpeed=0;
  circleY=height/2;

//Rect button movement

rectY= rectY+rectSpeed;
rectSpeed=rectSpeed - gravity;

if(rectY < height/2-50){
  rectSpeed=0;
  rectY=height/2-50;
}

}

// scenes

 if (star){
  background(100);
  pushStyle();
  stroke(255);
  strokeWeight(10);
  point(width/2, height/2);
  popStyle();
  ellipse(circleX, circleY, circleSize, circleSize);
}
  if (star){
  background(200);
  pushStyle();
  stroke(255);
  strokeWeight(10);
  point(width/2, height/2);
  popStyle();
  rect(rectX, rectY, rectSize, rectSize);
  }
  

}

void mousePressed(){
 if(circleOver){
   circleSpeed = circleJump;
   star=!star;
  }
  if (rectOver){
    rectSpeed= rectJump;
  }
}
    


void update(int x, int y) {
  if (overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

boolean overRect(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
