import 'package:flutter/material.dart';
import 'package:weather_layouts/drawer.dart';

void main() => runApp(Daily());

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Forecast'),
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Day $index'),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.wb_sunny),
                    Text('High: 30°C'),
                    Text('Low: 20°C'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
