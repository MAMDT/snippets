//JSON Weather API: https://openweathermap.org
//Get weather info for Maastricht

void setup() {
  getWeather();
}

void getWeather() {
  String api_key = "your-api-key";
  // it takes a few minutes for a new api_key to become valid, have patience. 
  JSONObject weatherjson = loadJSONObject("https://api.openweathermap.org/data/2.5/weather?id=2751283&units=metric&APPID=" + api_key);

  JSONObject main = weatherjson.getJSONObject("main");
  JSONObject wind = weatherjson.getJSONObject("wind");

  float temp = main.getFloat("temp");
  float windSpeed = wind.getFloat("speed");
  int windDirection = wind.getInt("deg");

  println("wind direction:" + windDirection);
  println("wind speed:" + windSpeed);
  println("temp:" + temp);
}
