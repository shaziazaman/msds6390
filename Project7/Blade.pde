class Blade
{
  float bladeLength = 0;
  float bladeWidth = 0;
  color bladeColor = color(0,0,0);
  float rotationAngle = 0;
  
  Blade(float bLength, float bWidth, color bColor, float bRotationAngle)
  {
    bladeLength = bLength;
    bladeWidth = bWidth;
    bladeColor = bColor;
    rotationAngle = bRotationAngle;
  }
  
  void drawBlade(Coordinates coordinates, float angleIncrement)
  {
    float x1 = 0;
    float y1 = 0;
    float x2 = x1 + bladeLength;
    float y2 = y1 - bladeWidth/2;
    float x3 = x1 + bladeLength;
    float y3 = y1 + bladeWidth/2;
    rotationAngle += angleIncrement;
    pushMatrix();
    translate(coordinates.xAxis, coordinates.yAxis);
    rotate(rotationAngle);
    fill(bladeColor);
    triangle(x1,y1,x2,y2,x3,y3);
    noFill();
    popMatrix();
  }
  
}