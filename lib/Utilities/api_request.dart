import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:news_app/Utilities/app_config.dart';

class API {
  Future<Map<String, dynamic>> request(String searchKey) async {
    debugPrint('API REQUEST: $searchKey');
    http.Response response;
    try {
      response = await http
          .get(
            Uri.parse(
              '${AppConfig.endPoint}everything?q=${searchKey}&sortBy=popularity&apiKey=${AppConfig.defaultKey}',
            ),
          )
          .timeout(const Duration(seconds: 3));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        debugPrint('API RESPONSE: ${(response.body.toString())}');
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == 'ok') {
          data['needPopUpError'] = false;
          return data;
        }
        data['needPopUpError'] = true;
        return {
          'success': false,
          'needPopUpError': true,
          'message': 'Slow Internet Connection',
        };
      } else {
        debugPrint(response.body);
        return jsonDecode(response.body);
        // throw Exception('API Response Failed');
      }
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Slow Internet Connection',
      };
    } on SocketException catch (e) {
      debugPrint('Socket Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'No Internet Connection',
      };
    } on FormatException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'API Error: Contact Developer',
      };
    } on HttpException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Disconnected from server',
      };
    }
  }
}
