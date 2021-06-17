import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.label1});
  final IconData icon;
  final String label;
  final String label1;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black54,
            size: 50.00,
          ),
          SizedBox(
            height: 20.00,
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 22.00,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.00,
          ),
          Text(
            label1,
            style: TextStyle(
              fontSize: 14.00,
              color: Colors.black54,
            ),
          ),
        ]);
  }
}
