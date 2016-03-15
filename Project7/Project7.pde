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
}

void draw()
{
  background(img);
  if(weatherClient.available() > 0)
  {
     weatherData.parseData(weatherClient.readString());
  }
  
  for(Windmill windmill: windmills)
  {
    windmill.speed = weatherData.windSpeed;
    windmill.drawWindmill();
  }
  delay(100);
}