import 'dart:async';
import './LoginValidator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with LoginValidator{
  // final _email = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => 
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  String get getEmail => _email.value;
  String get getPassword => _password.value;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('valid email is $validEmail and valid Password is $validPassword');
  }
  
  dispose(){
    _email.close();
    _password.close();
  }
}