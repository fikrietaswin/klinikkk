import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardTitle;
  final String description;

  HomeCard(this.cardTitle, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Container(
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(cardTitle),
                  subtitle: Text(description),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('KLIK'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}