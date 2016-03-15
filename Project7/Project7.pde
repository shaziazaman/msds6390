import processing.net.*;

// MSDS 6390 - 404
// Programmer: Shazia Zaman
// Title: Windmill 
// Project 7

Windmill[] windmills = new Windmill[3];
PImage img;
Client weatherClient;
String apiKey="0b55e5f12b5583816c9356d808f18249";
String url="api.openweathermap.org";
String api = "/data/2.5/weather?appid=" + apiKey + "&units=imperial&q=";
String[] cities = {"San_Francisco,ca","Dallas,tx","Chicago,il"};
WeatherData weatherData;
color textColor = color(0,0,0);  
color spiralColor = color(255,253,252);
float[] xValueForWindSpiralArray = new float[2];
void setup()
{
 size(960,600);

 int citySubscript = (int)random(0,cities.length-1);
 String city = cities[citySubscript];
 String apiWithCity = api + city;
 weatherClient = new Client(this,url,80);
 weatherClient.write("GET " + apiWithCity + " HTTP/1.0\r\n");
 weatherClient.write("\r\n");  

 prepareOnExitHandler();
 
 weatherData = new WeatherData();
 
 noStroke();
 img = loadImage("fields3.jpg");
 windmills[0] = new Windmill(new Coordinates(150,150), "windmill0",3);
 windmills[1] = new Windmill(new Coordinates(350,150), "windmill1",3);
 windmills[2] = new Windmill(new Coordinates(550,150), "windmill2",5);  
 
 for(int i = 0; i < xValueForWindSpiralArray.length; i++) {
   xValueForWindSpiralArray[i] = random(0,width);
 }
}

void draw()
{
  background(img);
  loadPixels();
  int pixelArraySubscript = (int)random(0,pixels.length-1);
  spiralColor = pixels[pixelArraySubscript];

  if(weatherClient.available() > 0)
  {
    weatherData.parseData(weatherClient.readString());
  }
  printWeatherDetails();
  for(Windmill windmill: windmills)
  {
    windmill.drawWindmill();
  }
  
  for(int i = 0; i < xValueForWindSpiralArray.length; i++) {
    xValueForWindSpiralArray[i] = xValueForWindSpiralArray[i] < width? xValueForWindSpiralArray[i] + weatherData.windSpeed/2:0;
  pushMatrix();
  translate(xValueForWindSpiralArray[i],random(0,height));
  drawSpiral(1000,30,200,0.992);
  popMatrix();
  }
  
  float delayTime = 5*(weatherData.windSpeed>0?weatherData.windSpeed:20);
  delay((int)delayTime);
}

public void printWeatherDetails() {
  fill(textColor);
  textSize(20);
  text("City: " + weatherData.city, 6*width/8,height/8);
  text("Temperature: " + weatherData.temperature, 6*width/8,2*height/8);
  text("Wind Speed: " + weatherData.windSpeed, 6*width/8,3*height/8);
  noFill();
}

void drawSpiral(float pts, int rots, float radius, float fallOff){

 float x=0;
 float y = 0;
 float theta = 0;
 beginShape();
 stroke(spiralColor);
 for(int i=0; i<pts; i++){
   x = cos(theta)*radius;
   y = sin(theta)*radius;
   vertex(x, y);
   radius*=fallOff;
   theta += TWO_PI*rots/pts;
 }
 endShape();
 //noFill();
 noStroke();
}