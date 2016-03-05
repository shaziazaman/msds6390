class Stand
{
  float standLength = 0;
  float standBaseWidth = 0;
  float standTopWidth = 0;
  color standColor = color(0,0,0);
  
  Stand(float sLength, float sBaseWidth, float sTopWidth, color sColor)
  {
    standLength = sLength;
    standBaseWidth = sBaseWidth;
    standTopWidth = sTopWidth;
    standColor = sColor;
  }
  
  void drawStand(Coordinates coordinates)
  {
     float x1 = 0;
     float y1 = 0;
     float x2 = x1 + standTopWidth;
     float y2 = 0;
     float x4 = x1 + standTopWidth/2 - standBaseWidth/2;
     float y4 = y1 + standLength;
     float x3 = x2 - standTopWidth/2 + standBaseWidth/2;
     float y3 = y4;
     
     pushMatrix();
     translate(coordinates.xAxis, coordinates.yAxis);
     fill(standColor);
     quad(x1,y1,x2,y2,x3,y3,x4,y4);
     noFill();
     popMatrix();
  }
}