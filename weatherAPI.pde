    //json Weather API : https://openweathermap.org/
    //Maastricht example

void getWeather() {
    JSONObject weatherjson = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?id=2751283&units=metric&APPID=*****enter APP ID HERE*******");
  
    JSONObject main = weatherjson.getJSONObject("main");
    JSONObject wind = weatherjson.getJSONObject("wind");

    temp = main.getFloat("temp");
    windSpeed = wind.getFloat("speed");
    windDirection = wind.getInt("deg");

    println("wind direction:" + windDirection);
    println("wind speed:" + windSpeed);
    println("temp:" + temp);
}