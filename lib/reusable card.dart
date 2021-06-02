import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({ @required this.colour, this.cardchild});

  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(5.00),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.00),
        ),
      ),
    );
  }
}