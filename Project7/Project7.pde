import processing.net.*;

// MSDS 6390 - 404
// Programmer: Shazia Zaman
// Title: Windmill 
// Project 7

Windmill[] windmills = new Windmill[3];
PImage img;
Client weatherClient;
String apiKey="5199c676bafa516b";
String url="api.wunderground.com";
String api = "/api/" + apiKey + "/conditions/q/";
String[] cities = {"CA/San_Francisco","TX/Dallas","NY/Manhattan"};
void setup()
{
 size(960,600);
 int citySubscript = (int)random(0,cities.length-1);
 String city = cities[citySubscript];
 String apiWithCity = api + city + ".json";
 weatherClient = new Client(this,url,80);
 weatherClient.write("GET " + apiWithCity + " HTTP/1.0\r\n");
 weatherClient.write("\r\n");  
 img = loadImage("fields3.jpg");
 noStroke();
 windmills[0] = new Windmill(new Coordinates(150,150), "windmill0",3);
 windmills[1] = new Windmill(new Coordinates(350,150), "windmill1",4);
 windmills[2] = new Windmill(new Coordinates(550,150), "windmill2",5);
  
}

void draw()
{
  background(img);
  if(weatherClient.available() > 0)
  {
   System.out.println(weatherClient.readString());
  }

  for(Windmill windmill: windmills)
  {
    windmill.drawWindmill();
  }
  delay(100);
}