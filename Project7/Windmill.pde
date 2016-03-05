class Windmill
{
  Coordinates coordinates;
  float centerDiameter = 10;
  float speed= 0.2;
  color centerColor = color(121,113,97);
  Stand stand;
  Blade[] blades = new Blade[3];
  String name = "";
  
  Windmill(Coordinates wCoordinates, String wName)
  {
    coordinates = wCoordinates;
    name = wName;
    stand = new Stand(200, 50, centerDiameter, color(4,131,9), name+"Stand");
    float rotationAngle = 0;
    for(int i = 0; i < blades.length; i++)
    {
       blades[i] = new Blade(115, 0.2, color(250,218,103), rotationAngle, name+"Blade"+i);
       rotationAngle += 3*PI/4;
    }
  }
  
  void drawWindmill()
  {
    drawCenter();
    float x = coordinates.xAxis - centerDiameter/2;
    float y = coordinates.yAxis+centerDiameter/2;
    Coordinates sCoordinates = new Coordinates(x,y);
    stand.drawStand(sCoordinates);
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
      float x = coordinates.xAxis + cos(blade.rotationAngle)*centerDiameter/2;
      float y = coordinates.yAxis + sin(blade.rotationAngle)*centerDiameter/2;
      Coordinates bCoordinates = new Coordinates(x,y);
      blade.drawBlade(bCoordinates, speed);
    } 
  }
}