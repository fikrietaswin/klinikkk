import 'package:flutter/material.dart';
import '../../src/screens/Home.dart' as home;
import '../../src/screens/Klinik_karir/KlinikKarir.dart' as klinikKarir;
import '../../src/screens/Profile.dart' as profile;
import '../../src/screens/MyProjects.dart' as projects;
import 'Klinik_karir/Chat.dart' as chat;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController btController;
  String appBarTitle = "FreeLancer";
  int bottomNavBarIndex = 0;
  var pages = [
    home.FreeLancer(),
    klinikKarir.Klinik(),
    chat.Chat(peerAvatar: null, peerId: null,),
    projects.MyProjects(),
    profile.Profiles()
  ];

  @override
    void initState() {
      btController = new TabController(vsync: this, length: 4);
      super.initState();
    }
  
  @override
    void dispose() {
      btController.dispose();
      super.dispose();
    }
    
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         body: pages[bottomNavBarIndex],
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: bottomNavBarIndex,
           onTap: (int index){
             setState(() {
                bottomNavBarIndex = index;            
             });           
           },
           type: BottomNavigationBarType.fixed,
           items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(icon: Icon(Icons.work), title: Text("FreeLancer",)),
             BottomNavigationBarItem(icon: Icon(Icons.local_hospital), title: Text("Klinik Karir")),
             BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Messages")),
             BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text("My Project")),
             BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Profile"),),
           ],
         ),
       ),
    );
  }
}