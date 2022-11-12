// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.location,
    required this.currentObservation,
    required this.forecasts,
  });

  final Location location;
  final CurrentObservation currentObservation;
  final List<Forecast> forecasts;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: Location.fromJson(json["location"]),
    currentObservation: CurrentObservation.fromJson(json["current_observation"]),
    forecasts: List<Forecast>.from(json["forecasts"].map((x) => Forecast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current_observation": currentObservation.toJson(),
    "forecasts": List<dynamic>.from(forecasts.map((x) => x.toJson())),
  };
}

class CurrentObservation {
  CurrentObservation({
    required this.wind,
    required this.atmosphere,
    required this.astronomy,
    required this.condition,
    required this.pubDate,
  });

  final Wind wind;
  final Atmosphere atmosphere;
  final Astronomy astronomy;
  final Condition condition;
  final int pubDate;

  factory CurrentObservation.fromJson(Map<String, dynamic> json) => CurrentObservation(
    wind: Wind.fromJson(json["wind"]),
    atmosphere: Atmosphere.fromJson(json["atmosphere"]),
    astronomy: Astronomy.fromJson(json["astronomy"]),
    condition: Condition.fromJson(json["condition"]),
    pubDate: json["pubDate"],
  );

  Map<String, dynamic> toJson() => {
    "wind": wind.toJson(),
    "atmosphere": atmosphere.toJson(),
    "astronomy": astronomy.toJson(),
    "condition": condition.toJson(),
    "pubDate": pubDate,
  };
}

class Astronomy {
  Astronomy({
    required this.sunrise,
    required this.sunset,
  });

  final String sunrise;
  final String sunset;

  factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Atmosphere {
  Atmosphere({
    required this.humidity,
    required this.visibility,
    required this.pressure,
    required this.rising,
  });

  final int humidity;
  final double visibility;
  final double pressure;
  final int rising;

  factory Atmosphere.fromJson(Map<String, dynamic> json) => Atmosphere(
    humidity: json["humidity"],
    visibility: json["visibility"].toDouble(),
    pressure: json["pressure"].toDouble(),
    rising: json["rising"],
  );

  Map<String, dynamic> toJson() => {
    "humidity": humidity,
    "visibility": visibility,
    "pressure": pressure,
    "rising": rising,
  };
}

class Condition {
  Condition({
    required this.code,
    required this.text,
    required this.temperature,
  });

  final int code;
  final String text;
  final int temperature;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    code: json["code"],
    text: json["text"],
    temperature: json["temperature"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "text": text,
    "temperature": temperature,
  };
}

class Wind {
  Wind({
    required this.chill,
    required this.direction,
    required this.speed,
  });

  final int chill;
  final int direction;
  final double speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    chill: json["chill"],
    direction: json["direction"],
    speed: json["speed"],
  );

  Map<String, dynamic> toJson() => {
    "chill": chill,
    "direction": direction,
    "speed": speed,
  };
}

class Forecast {
  Forecast({
    required this.day,
    required this.date,
    required this.low,
    required this.high,
    required this.text,
    required this.code,
  });

  final String day;
  final int date;
  final int low;
  final int high;
  final String text;
  final int code;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    day: json["day"],
    date: json["date"],
    low: json["low"],
    high: json["high"],
    text: json["text"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "date": date,
    "low": low,
    "high": high,
    "text": text,
    "code": code,
  };
}

class Location {
  Location({
    required this.city,
    required this.region,
    required this.woeid,
    required this.country,
    required this.lat,
    required this.long,
    required this.timezoneId,
  });

  final String city;
  final String region;
  final int woeid;
  final String country;
  final double lat;
  final double long;
  final String timezoneId;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    region: json["region"],
    woeid: json["woeid"],
    country: json["country"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    timezoneId: json["timezone_id"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "region": region,
    "woeid": woeid,
    "country": country,
    "lat": lat,
    "long": long,
    "timezone_id": timezoneId,
  };
}
