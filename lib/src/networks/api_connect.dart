import 'package:http/http.dart' as http;
import '../utils/config.dart';
import 'dart:io';

class ApiConnect { 
  postRequest(Map credentials, String url) {
    return http.post(
      "${Config.basedUrl}/$url",
      headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Basic ZGV2YXBwczpkZXZ0a2lk",
          "x-api-key": "devappstkid"
      },
      body: credentials
    );
  }

  getRequest(String url) {
    return http.post(
      "${Config.basedUrl}/$url",
      headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Basic ZGV2YXBwczpkZXZ0a2lk",
          "x-api-key": "devappstkid"
      },
    );
  }
}