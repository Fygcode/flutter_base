// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class ApiService {
//   static const String baseUrl = 'https://api.example.com'; // Replace with your API base URL
//   static final _logger = Logger();
//   static final _storage = FlutterSecureStorage();
//
//   // GET request
//   static Future<dynamic> get(String endpoint) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/$endpoint')).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('GET request error: $e');
//       rethrow;
//     }
//   }
//
//   // POST request
//   static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//         body: json.encode(data),
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('POST request error: $e');
//       rethrow;
//     }
//   }
//
//   // POST request with Multipart
//   static Future<dynamic> postMultipart(String endpoint, Map<String, String> fields, File file) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoint'));
//
//       request.fields.addAll(fields);
//       request.files.add(await http.MultipartFile.fromPath('file', file.path));
//       request.headers['Authorization'] = 'Bearer ${await _getToken()}';
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('Multipart POST request error: $e');
//       rethrow;
//     }
//   }
//
//   // PUT request
//   static Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.put(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//         body: json.encode(data),
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('PUT request error: $e');
//       rethrow;
//     }
//   }
//
//
//   // DELETE request
//   static Future<dynamic> delete(String endpoint) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.delete(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('DELETE request error: $e');
//       rethrow;
//     }
//   }
//
//   // Process Response
//   static dynamic _processResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         return json.decode(response.body);
//       case 400:
//         throw Exception('Bad request: ${response.body}');
//       case 401:
//         throw Exception('Unauthorized: ${response.body}');
//       case 403:
//         throw Exception('Forbidden: ${response.body}');
//       case 404:
//         throw Exception('Not found: ${response.body}');
//       case 500:
//         throw Exception('Internal server error: ${response.body}');
//       default:
//         throw Exception('Failed to load data: ${response.body}');
//     }
//   }
//
//   // Check Internet Connection
//   static Future<bool> _checkInternetConnection() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   // Get Token from Secure Storage
//   static Future<String> _getToken() async {
//     return await _storage.read(key: 'auth_token') ?? '';
//   }
// }
//
//
//
// /////////////////////////////////////////////////
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:your_app/config/config.dart';
//
// class ApiService {
//   static late final String baseUrl;
//   static final _logger = Logger();
//   static final _storage = FlutterSecureStorage();
//
//   static Future<void> init(String env) async {
//     final config = await Config.getInstance(env);
//     baseUrl = config.baseUrl;
//   }
//
//   // GET request
//   static Future<dynamic> get(String endpoint) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/$endpoint')).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('GET request error: $e');
//       rethrow;
//     }
//   }
//
//   // POST request
//   static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//         body: json.encode(data),
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('POST request error: $e');
//       rethrow;
//     }
//   }
//
//   // PUT request (Update)
//   static Future<dynamic> update(String endpoint, Map<String, dynamic> data) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.put(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//         body: json.encode(data),
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('PUT request error: $e');
//       rethrow;
//     }
//   }
//
//   // DELETE request
//   static Future<dynamic> delete(String endpoint) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       final response = await http.delete(
//         Uri.parse('$baseUrl/$endpoint'),
//         headers: {
//           'Authorization': 'Bearer ${await _getToken()}',
//         },
//       ).timeout(const Duration(seconds: 10));
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('DELETE request error: $e');
//       rethrow;
//     }
//   }
//
//   // POST request with Multipart
//   static Future<dynamic> postMultipart(String endpoint, Map<String, String> fields, File file) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoint'));
//
//       request.fields.addAll(fields);
//       request.files.add(await http.MultipartFile.fromPath('file', file.path));
//       request.headers['Authorization'] = 'Bearer ${await _getToken()}';
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       return _processResponse(response);
//     } catch (e) {
//       _logger.e('Multipart POST request error: $e');
//       rethrow;
//     }
//   }
//
//   // Process Response
//   static dynamic _processResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         var responseBody = json.decode(response.body);
//         if (responseBody is List) {
//           return responseBody.map((e) => e).toList();
//         } else {
//           return responseBody;
//         }
//       case 400:
//         throw Exception('Bad request: ${response.body}');
//       case 401:
//         throw Exception('Unauthorized: ${response.body}');
//       case 403:
//         throw Exception('Forbidden: ${response.body}');
//       case 404:
//         throw Exception('Not found: ${response.body}');
//       case 500:
//         throw Exception('Internal server error: ${response.body}');
//       default:
//         throw Exception('Failed to load data: ${response.body}');
//     }
//   }
//
//   // Check Internet Connection
//   static Future<bool> _checkInternetConnection() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   // Get Token from Secure Storage
//   static Future<String> _getToken() async {
//     return await _storage.read(key: 'auth_token') ?? '';
//   }
// }
//

////////////////////////////////////

//
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// import 'package:logger/logger.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:stacked_node/core/model/todo_model.dart';
// import 'package:stacked_node/core/model/user_model.dart';
// import 'package:stacked_node/services/token_manager.dart';
//
// class ApiService {
//   static const String baseUrl = 'https://jsonplaceholder.typicode.com'; // Replace with your API base URL
//   static final _logger = Logger();
//   static const _storage = FlutterSecureStorage();
//
//   static Future<String?> _refreshToken() async {
//     final newToken = await makeRefreshTokenRequest();
//     if (newToken != null) {
//       await TokenManager.setToken(newToken);
//     }
//     return newToken;
//   }
//
//   static Future<String?> makeRefreshTokenRequest() async {
//     // Assuming the refresh token is also stored in secure storage
//     final refreshToken = await TokenManager.getRefreshToken();
//     if (refreshToken == null) {
//       return null;
//     }
//
//     final response = await http.post(
//       Uri.parse('https://api.example.com/refresh-token'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({'refresh_token': refreshToken}),
//     );
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final newToken = data['access_token'];
//       await TokenManager.setToken(newToken);
//       return newToken;
//     } else {
//       // Handle errors (e.g., refresh token expired or invalid)
//       return null;
//     }
//   }
//
//   // Intercept request and refresh token if necessary
//   static Future<http.Response> _interceptRequest(http.BaseRequest request) async {
//     final token = await TokenManager.getToken();
//     if (token != null) {
//       request.headers['Authorization'] = 'Bearer $token';
//     }
//
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//
//     if (response.statusCode == 401) {
//       final newToken = await _refreshToken();
//       if (newToken != null) {
//         // Retry the request with the new token
//         request.headers['Authorization'] = 'Bearer $newToken';
//         streamedResponse = await request.send();
//         response = await http.Response.fromStream(streamedResponse);
//       }
//     }
//     return response;
//   }
//
//   // Map Api Method //
//   static Future<T> request<T>(
//       String endpoint, {
//         String method = 'GET',
//         dynamic data,       // Map<String, dynamic>? data,
//       }) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ${await _getToken()}',
//     };
//
//     final uri = Uri.parse('$baseUrl/$endpoint');
//     print("=== $uri");
//     final request = http.Request(method, uri);
//     print("== method == $request");
//
//     if (data != null && (data is List || data is Map)) {
//       request.body = json.encode(data);
//     }
//
//     request.headers.addAll(headers);
//
//     // try {
//     //   final response = await _interceptRequest(request);
//     //   return _processResponse(response);
//     // } catch (e) {
//     //   _logger.e('$method request error: $e');
//     //   rethrow;
//     // }
//
//     try {
//       final streamedResponse = await http.Client().send(request);
//       final response = await http.Response.fromStream(streamedResponse);
//       return _processResponse<T>(response);
//     }
//     catch (e) {
//       _logger.e('$method request error: $e');
//       rethrow;
//     }
//
//   }
//
//
//   /// List Api Method ////
//   static Future<List<T>> requestList<T>(
//       String endpoint, {String method = 'GET', dynamic data, // Map<String, dynamic>? data,
//       }) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ${await _getToken()}',
//     };
//
//     final uri = Uri.parse('$baseUrl/$endpoint');
//     print("=== $uri");
//     final request = http.Request(method, uri);
//     print("== method == $request");
//
//     if (data != null && (data is List || data is Map)) {
//       request.body = json.encode(data);
//     }
//
//     request.headers.addAll(headers);
//
//   //  request.headers.addAll(_headers(body, authenticated));
//
//     // try {
//     //   final response = await _interceptRequest(request);
//     //   return _processResponse(response);
//     // } catch (e) {
//     //   _logger.e('$method request error: $e');
//     //   rethrow;
//     // }
//
//     try {
//       final streamedResponse = await http.Client().send(request);
//       final response = await http.Response.fromStream(streamedResponse);
//       return _processResponseList<T>(response);
//     }
//     catch (e) {
//       _logger.e('$method request error: $e');
//       rethrow;
//     }
//
//   }
//
//   // POST request with Multipart
//   static Future<dynamic> postMultipart(String endpoint, Map<String, String> fields, File file) async {
//     if (!await _checkInternetConnection()) {
//       throw Exception('No internet connection');
//     }
//
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoint'));
//
//       request.fields.addAll(fields);
//       request.files.add(await http.MultipartFile.fromPath('file', file.path));
//       request.headers['Authorization'] = 'Bearer ${await _getToken()}';
//
//       // var streamedResponse = await request.send();
//       // var response = await http.Response.fromStream(streamedResponse);
//
//       var response = await _interceptRequest(request);
//       return _processResponse(response);
//
//     } catch (e) {
//       _logger.e('Multipart POST request error: $e');
//       rethrow;
//     }
//   }
//
//   static Future<T> _processResponse<T>(http.Response response) async {
//     final responseBody = response.body;
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         var responseBody = json.decode(response.body);
//         return _fromJson<T>(responseBody);
//       case 400:
//         throw Exception('Bad request: $responseBody');
//       case 401:
//         throw Exception('Unauthorized: $responseBody');
//       case 403:
//         throw Exception('Forbidden: $responseBody');
//       case 404:
//         throw Exception('Not found: $responseBody');
//       case 500:
//         throw Exception('Internal server error: $responseBody');
//       default:
//         throw Exception('Failed to load data: $responseBody');
//     }
//   }
//
//   static Future<List<T>> _processResponseList<T>(http.Response response) async {
//     final responseBody = response.body;
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//       var decodedBody = json.decode(responseBody);
//       return decodedBody.map((item) => _fromJson<T>(item)).cast<T>().toList();
//       case 400:
//         throw Exception('Bad request: $responseBody');
//       case 401:
//         throw Exception('Unauthorized: $responseBody');
//       case 403:
//         throw Exception('Forbidden: $responseBody');
//       case 404:
//         throw Exception('Not found: $responseBody');
//       case 500:
//         throw Exception('Internal server error: $responseBody');
//       default:
//         throw Exception('Failed to load data: $responseBody');
//     }
//   }
//
//   static Future<bool> _checkInternetConnection() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   static Future<String?> _getToken() async {
//     return await _storage.read(key: 'auth_token');
//   }
//
//  static Map<String, String> _headers(Object? body, bool authenticated) {
//     Map<String, String> headerParams = {};
//     headerParams["HttpHeaders.contentTypeHeader"] = "application/json";
//     if (body is String) {
//       headerParams["Content-Type"] = "application/x-www-form-urlencoded";
//     } else if (body is Map) {
//       headerParams['Accept'] = "application/json";
//       headerParams["Content-Type"] = "application/json";
//     } else if (body is http.MultipartRequest) {
//       headerParams['Accept'] = "application/json";
//       headerParams["Content-Type"] = "multipart/form-data";
//     }
//     if (authenticated) {
//       headerParams['Authorization'] = 'Bearer ${_getToken()}';
//     }
//     return headerParams;
//   }
//
//
//   static T _fromJson<T>(Map<String, dynamic> json) {
//     if (T == UserModel) {
//       return UserModel.fromJson(json) as T;
//     } else if ( T == TodoModel) {
//       return TodoModel.fromJson(json) as T;
//     }else {
//       throw Exception('Unknown class');
//     }
//   }
// }

//////

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stacked_node/services/token_manager.dart';

import '../core/model/todo_model.dart';
import '../core/model/user_model.dart';

class ApiBaseService {
  static const String baseUrl =
      'http://localhost:3000/api'; // 'https://jsonplaceholder.typicode.com';
  static final _logger = Logger();
  static const _storage = FlutterSecureStorage();

  // Token Refresh Function //

  // static Future<String?> _refreshToken() async {
  //   final newToken = await makeRefreshTokenRequest();
  //   if (newToken != null) {
  //     await TokenManager.setToken(newToken);
  //   }
  //   return newToken;
  // }
  //
  // static Future<String?> makeRefreshTokenRequest() async {
  //   // Assuming the refresh token is also stored in secure storage
  //   final refreshToken = await TokenManager.getRefreshToken();
  //   if (refreshToken == null) {
  //     return null;
  //   }
  //
  //   final response = await http.post(
  //     Uri.parse('https://api.example.com/refresh-token'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({'refresh_token': refreshToken}),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     final newToken = data['access_token'];
  //     await TokenManager.setToken(newToken);
  //     return newToken;
  //   } else {
  //     // Handle errors (e.g., refresh token expired or invalid)
  //     return null;
  //   }
  // }
  // // Intercept request and refresh token if necessary
  // static Future<http.Response> _interceptRequest(http.BaseRequest request) async {
  //   final token = await TokenManager.getToken();
  //   if (token != null) {
  //     request.headers['Authorization'] = 'Bearer $token';
  //   }
  //
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //
  //   if (response.statusCode == 401) {
  //     final newToken = await _refreshToken();
  //     if (newToken != null) {
  //       // Retry the request with the new token
  //       request.headers['Authorization'] = 'Bearer $newToken';
  //       streamedResponse = await request.send();
  //       response = await http.Response.fromStream(streamedResponse);
  //     }
  //   }
  //   return response;
  // }

  static Future<List<T>> requestList<T>(String endpoint,
      {String method = 'GET',
      Object? body,
      Map<String, String>? params,
      bool authenticated = true}) async {
    try {
      var response = await _sendAsync(method, endpoint, body,
          queryParams: params, authenticated: authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 204) {
          return jsonResponse
              .map((item) => _fromJson<T>(item))
              .cast<T>()
              .toList();
        } else {
          throw Exception('Error: ${response.body}');
        }
      }
    } on TimeoutException {
      Fluttertoast.showToast(
          msg: "There is a problem connecting to the server.");
    } catch (exception) {
      print('Exception: $exception');
    }
    throw Exception("No Response: something error");
  }

  static Future<T> request<T>(String endpoint,
      {String method = 'GET',
      Object? body,
      Map<String, String>? params,
      bool authenticated = true}) async {
    try {
      var response = await _sendAsync(method, endpoint, body,
          queryParams: params, authenticated: authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204) {
          return _fromJson<T>(jsonResponse);
        } else {
          throw Exception('Error: ${response.body}');
        }
      }
    } on TimeoutException {
      Fluttertoast.showToast(
          msg: "There is a problem connecting to the server.");
    } catch (exception) {
      print('Exception: $exception');
    }
    throw Exception("No Response: something error");
  }

  static Future<http.Response?> _sendAsync(
      String method, String endpoint, Object? body,
      {Map<String, String>? queryParams, bool authenticated = true}) async {
    var url = Uri.parse(baseUrl +
        endpoint +
        (queryParams != null
            ? '?${Uri(queryParameters: queryParams).query}'
            : ""));
    var requestMessage = http.Request(method, url);

    print("=== API URL : $requestMessage");
    print("=== API BODY DATA : $body");

    if (body != null && body is! http.MultipartRequest) {
      requestMessage.body = json.encode(body);
    }

    requestMessage.headers.addAll(_headers(body, authenticated));

    print("=== HEADER : ${requestMessage.headers}");

    http.Response? response;

    try {
      if (body is http.MultipartRequest) {
        body.headers.addAll(requestMessage.headers);
        response = await http.Response.fromStream(await body.send());
      } else {
        response = await http.Response.fromStream(
            await http.Client().send(requestMessage));
      }
    } on HttpException catch (e) {
      print("HTTP Exception: $e");
      Fluttertoast.showToast(msg: "HTTP Exception: $e");
    }

    return _handleResponse(response);
  }

  static Map<String, String> _headers(Object? body, bool authenticated) {
    Map<String, String> headerParams = {};
    headerParams["HttpHeaders.contentTypeHeader"] = "application/json";
    if (body is String) {
      headerParams["Content-Type"] = "application/x-www-form-urlencoded";
    } else if (body is Map) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "application/json";
    } else if (body is http.MultipartRequest) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "multipart/form-data";
    }
    if (authenticated) {
      headerParams['Authorization'] = 'Bearer ${_getToken()}';
    }
    return headerParams;
  }

  static Future<http.Response?> _handleResponse(http.Response? response) async {
    if (response == null) {
      return null;
    }
    debugPrint("=== RESPONSE : ${response.body}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(msg: "Your session has expired");
      // Handle session expiration
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      Fluttertoast.showToast(msg: "Client Error: ${response.statusCode}");
    } else if (response.statusCode >= 500) {
      Fluttertoast.showToast(msg: "Server Error: ${response.statusCode}");
    }
    return null;
  }

  Future<dynamic> uploadImage(File file, String endpoint) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint))
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    var response =
        await _sendAsync('POST', endpoint, request, authenticated: true);
    if (response != null) {
      return jsonDecode(response.body)['file'];
    }
    throw Exception("Image upload failed");
  }

  // Get Token from Secure Storage
  static Future<String> _getToken() async {
    return await _storage.read(key: 'auth_token') ?? '';
  }

  static T _fromJson<T>(Map<String, dynamic> json) {
    if (T == UserModel) {
      return UserModel.fromJson(json) as T;
    } else if (T == TodoModel) {
      return TodoModel.fromJson(json) as T;
    } else {
      throw Exception('Unknown class');
    }
  }
}
