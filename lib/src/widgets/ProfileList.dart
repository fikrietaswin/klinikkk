import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final String subTitle;

  ProfileList(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey
          )
        ),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(color: Colors.black, fontSize: 18.0)),
          Text(subTitle, style: TextStyle(fontSize: 14.0),)
        ],
      ),
    );
  }
}