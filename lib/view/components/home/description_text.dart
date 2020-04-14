import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return textBlock();
  }

  Widget textBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title(),
        SizedBox(height: 5),
        tutorial(),
      ],
    );
  }

  Widget title() {
    return Text('Please enter a channel name',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 19),
    );
  }

  Widget tutorial() {
    return Text('Second person must enter the same name to join',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    );
  }
}
