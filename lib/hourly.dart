import 'package:flutter/material.dart';
import 'package:weather_layouts/drawer.dart';

void main() => runApp(Hourly());

class Hourly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hourly Forecast'),
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: 24,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index:00'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.wb_sunny),
                  Text('25°C'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
