import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  List dataJson;

  Future<String> ambilData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://www.topkarir.com/api/lokasi/provinsi"),
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Basic ZGV2YXBwczpkZXZ0a2lk",
          "x-api-key": "devappstkid"
        });

    this.setState(() {
      dataJson = jsonDecode(hasil.body);
    });
    // return jsonDecode(hasil.body);
  }

  @override
  void initState() {
    this.ambilData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Projects"),
        leading: Icon(Icons.folder),
      ),
      body: new ListView.builder(
        itemCount: dataJson == null ? 0 : dataJson.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: EdgeInsets.all(8.0),
            child: new Card(
                child: new Container(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          dataJson[i]['id'],
                          style:
                              new TextStyle(fontSize: 20.0, color: Colors.blue),
                        ),
                        new Text(
                          dataJson[i]['provinsi'],
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                        Text(
                          "5 days left",
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ))));
      },
    ));
  }
}
