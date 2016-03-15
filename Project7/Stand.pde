class Stand
{
  float standLength = 0;
  float standBaseWidth = 0;
  float standTopWidth = 0;
  float originalStandLength = standLength;
  float originalStandBaseWidth = standBaseWidth;
  float originalStandTopWidth = standTopWidth;
  color standColor = color(0,0,0);
  String name = "";
  
  Stand(float sLength, float sBaseWidth, float sTopWidth, color sColor, String sName)
  {
    standLength = sLength;
    standBaseWidth = sBaseWidth;
    standTopWidth = sTopWidth;
    originalStandLength = standLength;
    originalStandBaseWidth = standBaseWidth;
    originalStandTopWidth = standTopWidth;
    standColor = sColor;
    name = sName;
  }
  
  void drawStand(Coordinates coordinates)
  {
     float x1 = coordinates.xAxis;
     float y1 = coordinates.yAxis;
     float x2 = x1 + standTopWidth;
     float y2 = y1;
     float x4 = x1 + standTopWidth/2 - standBaseWidth/2;
     float y4 = y1 + standLength;
     float x3 = x2 - standTopWidth/2 + standBaseWidth/2;
     float y3 = y4;
     
     fill(standColor);
     quad(x1,y1,x2,y2,x3,y3,x4,y4);
     noFill();
  }
  
  void resize(float resizeRatio)
  {
    standLength = originalStandLength * resizeRatio;
    standBaseWidth = originalStandBaseWidth * resizeRatio;
    standTopWidth = originalStandTopWidth * resizeRatio;
  }
}