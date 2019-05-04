import 'package:flutter/material.dart';

class StatisticsGridView extends StatelessWidget {

  final List allCities;
  StatisticsGridView({this.allCities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(10.0),
      children: allCities.map((city) {
        return _getGridViewItemUI(context, city);
      }).toList(),
    );
  }

  Widget _getGridViewItemUI(BuildContext context,city) {
    return InkWell(
      onTap: () {
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Text("256"),
            Text("非常满意")
          ],
        ),
      ),
    );
  }
}