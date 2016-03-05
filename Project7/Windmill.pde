class Windmill
{
  Coordinates coordinates;
  float centerDiameter = 1;
  float speed= 0.2;
  color centerColor = color(121,113,97);
  Stand stand;
  Blade[] blades = new Blade[3];
  
  Windmill(Coordinates wCoordinates)
  {
    coordinates = wCoordinates;
    stand = new Stand(200, 50, centerDiameter, color(4,131,9));
    float rotationAngle = 0;
    for(int i = 0; i < blades.length; i++)
    {
       blades[i] = new Blade(115, 50, color(250,218,103), rotationAngle);
       rotationAngle += 3*PI/4;
    }
  }
  
  void drawWindmill()
  {
    drawCenter();
    stand.drawStand(coordinates);
    runWindmill();
  }
  
  void drawCenter()
  {
    float x = coordinates.xAxis;
    float y = coordinates.yAxis;
    fill(centerColor);
    ellipse(x, y, centerDiameter,centerDiameter);
    noFill();
  }
  
  void runWindmill()
  {
    for(Blade blade : blades)
    {
      blade.drawBlade(coordinates, speed);
    } 
  }
}