import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

enum APIType { tPost, tGet, tPut, tDelete }

class API {

  static Future<String?> callAPI({
    required String url,
    required APIType type,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    print("URL==>>${url}");

    try {
      http.Response apiResponse;

      final dio.Dio _dio = dio.Dio();
      // String apiBody = jsonEncode(body);
      dynamic apiBody = body;

      Map<String, String> appHeader = {
        "content-type": "application/json",
      };
      log("REQ BODY===>>>>${jsonEncode(apiBody)}");

      /// if there are any other header for different kind of apis then attach
      /// dynamically passed parameters.
      if (header != null) {
        appHeader.addAll(header);
        print("Header===>>>>${appHeader}");
      }

      /// [POST CALL]

      if (type == APIType.tPost) {
        print('POST API BODY--------${jsonEncode(apiBody)}');
        assert(body != null);

        apiResponse = await http.post(
          Uri.parse(url),
          body: jsonEncode(apiBody),
          headers: appHeader,
        );
      } else if (type == APIType.tGet) {
        print("GET METHOD CALLED ${url}===${header}");
        apiResponse = await http.get(
          Uri.parse(url),
          headers: appHeader,
        );
        print("GET METHOD CALLED ${apiResponse.statusCode}");
      } else if (type == APIType.tPut) {
        apiResponse = await http.put(
          Uri.parse(url),
          body: jsonEncode(apiBody),
          headers: appHeader,
        );
      } else {
        apiResponse = await http.delete(
          Uri.parse(url),
          body: jsonEncode(apiBody),
          headers: appHeader,
        );
      }

      print("STATUS CODE===>>>>>${apiResponse.statusCode}");
      print("APIBODY===>>>>>${apiResponse.body}");

      // List<dynamic> response = jsonDecode();

      switch (apiResponse.statusCode) {
        case 200:
          return apiResponse.body;
        case 256:
          return apiResponse.body;
        case 201:
          return apiResponse.body;
        case 204:
          return apiResponse.body;
        case 500:
          return null;
        case 404:
          return null;
        case 400:
          return null;
        case 401:
          return null;
        default:
          return null;
      }
    } catch (e) {
      print("ERR===>>>>${e}");
      return null;
    }
  }

  static Future<dynamic> callDioAPI({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
    List<File>? file,
  }) async {
    print("URL==>>${url}");

    try {
      dio.Response apiResponse;

      final dio.Dio _dio = dio.Dio();
      // String apiBody = jsonEncode(body);
      dynamic apiBody = body;

      Map<String, String> appHeader = {
        "content-type": "application/json",
      };
      log("REQ BODY===>>>>${jsonEncode(apiBody)}");

      /// if there are any other header for different kind of apis then attach
      /// dynamically passed parameters.
      if (header != null) {
        appHeader.addAll(header);
        print("Header===>>>>${appHeader}");
      }

      /// [POST CALL]

      String username = 'GowthamHN10';
      String password = 'Gowthu@123';
      String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));

      List<dio.MultipartFile> mList = file!
          .map(
            (e) => MultipartFile.fromFileSync(
              e.path,
              filename: DateTime.now().microsecondsSinceEpoch.toString(),
            ),
          )
          .toList();

      FormData formData = FormData.fromMap({
          "file": mList,
        },
      );

      log('=====mList======${formData.files}');


      apiResponse = await _dio.post(
        url,
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': "form-data",
          },
        ),
      );

      print("STATUS CODE===>>>>>${apiResponse.statusCode}");
      print("APIBODY===>>>>>${apiResponse.data}");

      // List<dynamic> response = jsonDecode();

      switch (apiResponse.statusCode) {
        case 200:
          return apiResponse.data;
        case 256:
          return apiResponse.data;
        case 201:
          return apiResponse.data;
        case 204:
          return apiResponse.data;
        case 500:
          return null;
        case 404:
          return null;
        case 400:
          return null;
        case 401:
          return null;
        default:
          return null;
      }
    } catch (e) {
      print("ERR===>>>>${e}");
      return null;
    }
  }
}
