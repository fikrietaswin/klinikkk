import 'package:flutter/material.dart';
import 'LoginBloc.dart';

class Provider extends InheritedWidget{
  final bloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;
  
  static LoginBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}