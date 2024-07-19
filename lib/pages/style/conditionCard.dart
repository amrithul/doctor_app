
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConditionCard extends StatefulWidget {
  final String title;
  final IconData icon;

  ConditionCard(this.title, this.icon);

  @override
  _ConditionCardState createState() => _ConditionCardState();
}

class _ConditionCardState extends State<ConditionCard> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 35, color: _isClicked ? Colors.pink : Colors.grey),
            SizedBox(height: 5),
            Text(widget.title, style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
