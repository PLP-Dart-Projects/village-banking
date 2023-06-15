
import 'package:flutter/material.dart';

Future<void> showInfoDialog (
    BuildContext context,
    String title,
    String line1,
    String line2,
    ) {
  return showDialog (
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 71, 20, 1)
            ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(line1,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic
                  ),
              ),
              Text(line2,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic
                  ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showErrorDialog (
    BuildContext context,
    String title,
    String line1,
    ) {
  return showDialog (
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(255, 71, 20, 1)
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(line1,
              style: const TextStyle(
                fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
