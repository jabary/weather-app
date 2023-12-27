import 'package:flutter/material.dart';
import 'package:weather_layouts/hourly.dart';
import 'package:weather_layouts/daily.dart';
import 'package:weather_layouts/main.dart';
import 'package:weather_layouts/places.dart';
import 'package:weather_layouts/testback.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the home screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWeatherApp()),
              );
            },
          ),
          ListTile(
            title: const Text('Hourly Forecast'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the hourly forecast screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hourly()),
              );
            },
          ),
          ListTile(
            title: const Text('Daily Forecast'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the daily forecast screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Daily()),
              );
            },
          ),
          ListTile(
            title: const Text('Places'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the daily forecast screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Places()),
              );
            },
          ),
          ListTile(
            title: const Text('Places'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the daily forecast screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBlurredBackgroundScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
