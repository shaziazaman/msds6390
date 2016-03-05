
// MSDS 6390 - 404
// Programmer: Shazia Zaman
// Title: Windmill 
// Project 7

Windmill[] windmills = new Windmill[3];

void setup()
{
  size(800,800);
  background(102,206,193);
  noStroke();
  windmills[0] = new Windmill(new Coordinates(150,150));
  windmills[1] = new Windmill(new Coordinates(350,150));
  windmills[2] = new Windmill(new Coordinates(550,150));
  
  for(Windmill windmill: windmills)
  {
    windmill.drawWindmill();
  }
}

void draw()
{
  for(Windmill windmill: windmills)
  {
    windmill.runWindmill();
  }
  delay(100);
}