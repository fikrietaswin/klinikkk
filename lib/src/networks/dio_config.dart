import 'package:dio/dio.dart';
import '../utils/config.dart';
import 'dart:io';

class DioConfig{
  var dio = new Dio(new Options(
        baseUrl: Config.basedUrl,
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Basic ZGV2YXBwczpkZXZ0a2lk",
          "x-api-key": "devappstkid"
        },
        contentType: ContentType.json,
        responseType: ResponseType.PLAIN));
}