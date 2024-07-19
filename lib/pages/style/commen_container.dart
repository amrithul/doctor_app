import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;
  final double? topMargin;

  const CommonContainer({required this.child, this.topMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height:450 ,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: topMargin ?? 100),
      decoration: BoxDecoration(
        color:(const Color(0xFF39559e)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
