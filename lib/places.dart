import 'package:flutter/material.dart';
import 'package:weather_layouts/drawer.dart';

class Places extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Weather'),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of cities
        itemBuilder: (context, index) {
          return Card(
            child: Stack(
              children: [
                ListTile(
                  title: Text('City $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('25°C'),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(20),
                    child:  Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.wb_sunny,
                        size: 60,
                        color: Colors.yellow,
                      ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}