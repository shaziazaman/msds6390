class Blade
{
  float bladeLength = 0;
  float bladeWidth = 0;
  color bladeColor = color(0,0,0);
  float rotationAngle = 0;
  String name = "";
  Blade(float bLength, float bWidth, color bColor, float bRotationAngle, String bName)
  {
    bladeLength = bLength;
    bladeWidth = bWidth;
    bladeColor = bColor;
    rotationAngle = bRotationAngle;
    name = bName;
  }
  
  void drawBlade(Coordinates coordinates, float angleIncrement)
  {
    float x1 = coordinates.xAxis;
    float y1 = coordinates.yAxis;
    float x2 = x1 + bladeLength*cos(rotationAngle-bladeWidth);
    float y2 = y1 + bladeLength*sin(rotationAngle-bladeWidth);
    float x3 = x1 + bladeLength*cos(rotationAngle+bladeWidth);
    float y3 = y1 + bladeLength*sin(rotationAngle+bladeWidth);
    rotationAngle += angleIncrement;

    fill(bladeColor);
    triangle(x1,y1,x2,y2,x3,y3);
    noFill();
  }
  
}