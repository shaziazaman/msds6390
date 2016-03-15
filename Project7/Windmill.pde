class Windmill
{
  Coordinates coordinates;
  float centerDiameter = 10;
  float originalCenterDiameter = centerDiameter;
  float speed= 0.2;
  color centerColor = color(121,113,97);
  Stand stand;
  Blade[] blades;
  String name = "";
  float resizeRatio = 1;
  Windmill(Coordinates wCoordinates, String wName, int bladeNumber)
  {
    coordinates = wCoordinates;
    name = wName;
    stand = new Stand(200, 50, centerDiameter, color(4,131,9), name+"Stand");
    float rotationAngle = random(0,PI);
    blades = new Blade[bladeNumber];
    for(int i = 0; i < blades.length; i++)
    {
       blades[i] = new Blade(115, 0.2, color(250,218,103), rotationAngle, name+"Blade"+i);
       rotationAngle += 2*PI/bladeNumber;
    }
  }
  
  void drawWindmill()
  {
    drawCenter();
    float x = coordinates.xAxis - centerDiameter/2;
    float y = coordinates.yAxis+centerDiameter/2;
    Coordinates sCoordinates = new Coordinates(x,y);
    stand.drawStand(sCoordinates);
    drawBlades();
  }
  
  void drawCenter()
  {
    float x = coordinates.xAxis;
    float y = coordinates.yAxis;
    fill(centerColor);
    ellipse(x, y, centerDiameter,centerDiameter);
    noFill();
  }
  
  void drawBlades()
  {
    for(Blade blade : blades)
    {
      float x = coordinates.xAxis + cos(blade.rotationAngle)*centerDiameter/2;
      float y = coordinates.yAxis + sin(blade.rotationAngle)*centerDiameter/2;
      Coordinates bCoordinates = new Coordinates(x,y);
      blade.drawBlade(bCoordinates, speed);
    } 
  }  
  
  void resize(float resizeValue)
  {
    if(resizeRatio < .3 ) {
      return;
    }
    float ratio = 1;
    resizeRatio +=  resizeValue/100;
    if(resizeValue < 0) {  
     ratio = resizeRatio;
    } else {
     ratio = 1/resizeRatio;
    }
    
    centerDiameter = originalCenterDiameter * ratio;
    stand.resize(ratio);
    for(Blade blade: blades)
    {
      blade.resize(ratio);
    }    
  }
}