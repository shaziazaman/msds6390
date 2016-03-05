
// MSDS 6390 - 404
// Programmer: Shazia Zaman
// Title: Windmill 
// Project 7

Windmill[] windmills = new Windmill[3];

void setup()
{
  size(800,800);
  noStroke();
  windmills[0] = new Windmill(new Coordinates(150,150), "windmill0");
  windmills[1] = new Windmill(new Coordinates(350,150), "windmill1");
  windmills[2] = new Windmill(new Coordinates(550,150), "windmill2");
  
}

void mouseDragged() 
{
 windmills[0].coordinates.xAxis = mouseX;
 windmills[0].coordinates.yAxis = mouseY;
}

void draw()
{
  background(102,206,193);
  for(Windmill windmill: windmills)
  {
    windmill.drawWindmill();
  }
  delay(100);
}