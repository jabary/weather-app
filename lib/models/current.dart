class Current{
  String name;
  String region;
  double lat;
  double lon;
  double temp;
  DateTime lastUpdate;
  Condition condition;

  Current({required this.name, required this.region,required this.lat,required this.lon,required this.temp,
    required this.lastUpdate ,required this.condition});

  factory Current.fromJson(dynamic json){
    return Current(
        name: json['location']['name'],
        region: json['location']['region'],
        lat: json['location']['lat'],
        lon: json['location']['lon'],
        temp: json['current']['temp_c'],
        lastUpdate: DateTime.parse(json['current']['last_updated']),
        condition: Condition(text: json['current']['condition']['text'], iconURI: json['current']['condition']['icon'])

    );
  }
}


class Condition{
  String text;
  String icon;

  Condition({required this.text,required String iconURI})
      : icon = 'https:$iconURI';

}