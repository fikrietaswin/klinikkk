import 'package:flutter/material.dart';
import '../../utils/preferences.dart';
import '../../utils/config.dart';
import '../../screens/Klinik_karir/Chat.dart';
import '../../widgets/HomeCard.dart';
import 'Kategori_klinik.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Klinik extends StatefulWidget {
  _KlinikState createState() => _KlinikState();
}

class _KlinikState extends State<Klinik> {
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
              FlatButton(color: Colors.blueAccent[10],
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FreeLancer()),
                  );
                },
                child: Container(child: Text('KATEGORI'),),
              ),
              FlatButton(color: Colors.blueAccent,
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chat(peerAvatar: null, peerId: null,)),
                  );
                },
                child: Container(),
              ),
              HomeCard("BERPENGALAMAN", "Belum ada text pasti di sini"),
            ],
          )
        ],
      )),
    );
  }
}