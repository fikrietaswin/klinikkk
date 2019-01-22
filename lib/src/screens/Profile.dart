import 'package:flutter/material.dart';
import '../widgets/ProfileList.dart';
import '../utils/config.dart';
import '../utils/preferences.dart';

class Profiles extends StatefulWidget {
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  String _vid = "";
  String _nama = "";
  String _email = "";
  String _phone = "";
  String _imageUrl = "http://www.moorelawpllc.com/wp-content/uploads/2012/09/default-person.jpg";

  void initState() { 
    super.initState();
    getString(Config.vid).then((onValue){
      setState(() {
        this._vid = onValue;  
        this._imageUrl = Config.userImageLink + onValue;        
      });
    });

    getString(Config.name).then((onValue){
      setState(() {
        this._nama = onValue;          
      });
    });

    getString(Config.email).then((onValue){
      setState(() {
        this._email = onValue;          
      });
    });

    getString(Config.phoneNumber).then((onValue){
      setState(() {
        this._phone = onValue;          
      });
    });
  }
  Widget buttonLogout(){
    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Container(
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0
        ),
        child: RaisedButton(
          padding: EdgeInsets.all(16.0),
          child: const Text(
            'Log Out',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          color: Colors.red,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          splashColor: Colors.blueGrey,
          onPressed: () {
            // Perform some action
          },
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
//          leading: Padding(
//              padding: EdgeInsets.all(8.0),
//              child: CircleAvatar(
//                backgroundImage: NetworkImage(
//                    _imageUrl),
//              )),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_nama),
              Text(
                "Lihat dan Edit Profilmu",
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  right: 1.0,
                ),
                child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right), onPressed: null))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              ProfileList("Email", _email),
              ProfileList("No. Handphone", _phone),
              ProfileList("Notifikasi", "Apa yang terjadi hari ini"),
              ProfileList("Versi Aplikasi", "1.0"),
              ProfileList("Rate", "Berikan Rating anda pada aplikasi kami"),
              ProfileList("Privacy Policy", "Buka Privacy policy kita"),
              ProfileList("Term and Conditions", "Buka Term and Conditions kita"),
              buttonLogout()
            ],
          ),
        ),
      ),
    );
  }
}
