class Coordinates 
{
  float xAxis;
  float yAxis;
  float maxDifference = 50;
  
  Coordinates(float xValue, float yValue) {
    xAxis = xValue;
    yAxis = yValue;
  }  
  
  String toString(){
    return "(" + xAxis +"," + yAxis + ")";
  }
  
  boolean isCloseToCoordinates(Coordinates coordinates)
  {
     boolean isClose = false;
     if((difference(xAxis, coordinates.xAxis) <= maxDifference) && (difference(yAxis, coordinates.yAxis) <= maxDifference))
     {
       isClose = true;
     }
     return isClose;
  }
  
  float difference(float value1, float value2) {
    return abs(value1 -value2);
  }
}