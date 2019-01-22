import 'dart:async';

class LoginValidator{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@') && email.isNotEmpty){
        sink.add(email);
      } else {
        sink.addError('Masukkan email yang valid');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 6 && password.isNotEmpty){
        sink.add(password);
      } else {
        sink.addError('Masukkan password minima 8 karakter');
      }
    }
  );
}