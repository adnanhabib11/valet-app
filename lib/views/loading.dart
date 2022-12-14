import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoadingPage {
  loader() {
    return SimpleDialog(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(color: Colors.blue),
            const SizedBox(height: 10),
          Text('Loading', textAlign: TextAlign.center),
          ],
        ),
      ],
    );
  }
}
