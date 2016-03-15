void mouseDragged() 
{
  
 Coordinates pCoordinates = new Coordinates(pmouseX, pmouseY);
 for(Windmill windmill : windmills)
 {
   if(pCoordinates.isCloseToCoordinates(windmill.coordinates))
   {
     windmill.coordinates.xAxis = mouseX;
     windmill.coordinates.yAxis = mouseY;
   }
 }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  
  Coordinates pCoordinates = new Coordinates(pmouseX, pmouseY);
  for(Windmill windmill : windmills)
 {
   if(pCoordinates.isCloseToCoordinates(windmill.coordinates))
   {
     windmill.resize(e);
   }
 }
}