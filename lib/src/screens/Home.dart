import 'package:flutter/material.dart';
import '../utils/preferences.dart';
import '../utils/config.dart';
import './Profile.dart';
import '../widgets/HomeCard.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FreeLancer extends StatefulWidget {
  _FreeLancerState createState() => _FreeLancerState();
}

class _FreeLancerState extends State<FreeLancer> {
  String _name = '';
  String _email = '';
  String _imageUrl = '';
  List<String> images = new List();

  void initState() {
    super.initState();
    getString(Config.name).then((onValue) {
      setState(() {
        _name = onValue;
        images.add(
            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg');
        images.add(
            'https://pngimage.net/wp-content/uploads/2018/06/karir-png-9.png');
        images.add(
            'https://pngimage.net/wp-content/uploads/2018/06/karir-png-9.png');
        images.add(
            'https://pngimage.net/wp-content/uploads/2018/06/karir-png-9.png');
        images.add(
            'https://pngimage.net/wp-content/uploads/2018/06/png-karir-7.png');
        images.add(
            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg');
      });
    });

    getString(Config.email).then((onValue) {
      setState(() {
        _email = onValue;
      });
    });

    getString(Config.vid).then((onValue) {
      setState(() {
        _imageUrl = Config.userImageLink + onValue;
        print(_imageUrl);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: const Color(0xFF00ABCD),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment
                  .topCenter, // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xFFE71E63),
                const Color(0xFFA01A57)
              ], // whitish to gray
              tileMode: TileMode.clamp, // repeats the gradient over the canvas
            ),
          ),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profiles()),
                  );
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(_imageUrl),
                          minRadius: 30.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        _name,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16.0, left: 16.0),
                child: Text(
                  _email,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.white))),
                  margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0)),
//             UserAccountsDrawerHeader(
//               accountName: Text(_name),
//               accountEmail: Text(_email),
//               currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(_imageUrl),),
//             ),
              ListTile(
                title: Text(
                  Config.profil,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  Config.notifikasi,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  Config.pengaturan,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ConstrainedBox(
                child: Swiper(
                  itemBuilder: (BuildContext context,int index){
                    return new Image.network(images[index],fit: BoxFit.fill,);
                  },
                  itemCount: images.length == 0 ? 1 : images.length,
                  pagination: new SwiperPagination(),
                  onTap: (index){
                    Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(images[index].toString())));
                  }         
                  // control: new SwiperControl(),
                ),
                  constraints:new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/3))
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              HomeCard("Klinik Karir", "Ini adalah aplikasi Klinik Karir TopKarir Indonesia"),
              HomeCard("Freelancer", "Ini adalah aplikasi Freelancer TopKarir Indonesia"),
            ],
          )
        ],
      )),
    );
  }
}