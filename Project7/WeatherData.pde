import processing.data.JSONArray;
import processing.data.JSONObject;

class WeatherData {

  /*
  {"coord":{"lon":-122.42,"lat":37.77},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"base":"cmc stations","main":{"temp":53.46,"pressure":1024,"humidity":71,"temp_min":50,"temp_max":55.4},"wind":{"speed":16.11,"deg":280},"clouds":{"all":40},"dt":1458013244,"sys":{"type":1,"id":478,"message":0.0114,"country":"US","sunrise":1458051575,"sunset":1458094657},"id":5391959,"name":"San Francisco","cod":200}
   
   */

  String city = "";
  float windSpeed = 0;
  float temperature = 0;

  public void parseData(String dataString)
  {
    int index = dataString.indexOf("{");
    if (index < 0 ) {
      return;
    }

    String jsonString = dataString.substring(index);  
    JSONObject jsonObj = parseJSONObject(jsonString);
    if (jsonObj != null)
    {
      System.out.println(jsonObj.toString());
      city = jsonObj.getString("name");
      JSONObject windJsonObj = jsonObj.getJSONObject("wind");
      windSpeed = windJsonObj.getFloat("speed");
      JSONObject mainJsonObj = jsonObj.getJSONObject("main");
      temperature = mainJsonObj.getFloat("temp");
    }
  }
}