import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_layouts/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_layouts/models/current.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyWeatherApp());


class MyWeatherApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return MyWeatherAppState();
  }

}

class MyWeatherAppState extends State<MyWeatherApp> {

  Current? current;

  getCurrentWeather() async{
    http.Response response = await fetchCurrentWeather();
    print(response.statusCode);

    var jsonObject = json.decode(response.body);
    // print(jsonObject);
    try{
      setState(() {
        current = Current.fromJson(jsonObject);
      });
    }
    catch (e){
      print('Error creating object from json: $e');
    }

  }

  Future<http.Response> fetchCurrentWeather(){
    return http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=3198f3a32192411388e95430230911&q=Hebron,Palestine&aqi=no"));
  }


  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        drawer: MyDrawer(),
        body: GestureDetector(
          onVerticalDragUpdate: (details){
            print("detected");
            if (details.primaryDelta! > 0){
              setState(() {
                print("refreshing");
                getCurrentWeather();
              });
            }
          },
          child: Stack(
          fit: StackFit.expand,
          children: [
          Image.asset(
          'images/background.jpeg', // Replace with your image URL
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the sigma values for the blur effect
          child: Container(
            color: Colors.black.withOpacity(0.2), // Adjust the opacity for the background color
          ),
        ),
        Center(
          child: current == null
          ? const CircularProgressIndicator()
          :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                current!.name,
                style: TextStyle(fontSize: 40, color: Colors.white70),
              ),
              Image.network(
                current!.condition.icon
              ),
              const SizedBox(height: 20),
              Text(
                "${current!.temp}\u2103",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                current!.condition.text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                DateFormat.yMd().add_jm().format(current!.lastUpdate),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        ]
        )
        )
      ),
    );
  }
}
