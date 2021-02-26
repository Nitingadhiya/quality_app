import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quality_app/models/api_data_class.dart';
import '../packages/config_package.dart';

Dio dio = new Dio();
final storage = GetStorage();

class Apis {
  //to get full path with paramiters
  static Future<String> getFullUrl(String apiName, List params) async {
    String _url = "";
    if (params.length > 0) {
      _url = apiName + "?";
      for (int i = 0; i < params.length; i++) {
        _url = _url + '${params[i]["key"]}=${params[i]["value"]}';
        if (i + 1 != params.length) _url = _url + "&";
      }
    } else
      _url = apiName;

    String url = apiUrl + '$_url';

    return url;
  }

  static Future<APIDataClass> getApi(String apiName, List params) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(
      Message: 'No Data',
      IsSuccess: false,
      Data: '0',
    );
    //Check For Internet
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      apiData.Message = "No Internet Access";
      apiData.IsSuccess = false;
      apiData.Data = 0;
      return apiData;
    } else {
      String url = await getFullUrl(apiName, params);
      print("$apiName URL: " + url);

      try {
        String authToken = storage.read(Session.authToken);
        print(authToken);

        // if (authToken == null || authToken == "") authToken = loginToken;

        dio.options.headers["Authorization"] = "Bearer $authToken";
        dio.options.headers['Accept'] = 'application/json';
        // dio.options.headers['Content-Type'] = 'application/json';
        final response = await dio.get(url);

        if (response.statusCode == 200) {
          //get response
          var responseData = response.data;
          print("$apiName Response: " + response.data.toString());
          print(responseData.toString());
          //set data to class
          apiData.Message = responseData["Message"];
          apiData.IsSuccess = responseData["IsSuccess"];
          apiData.Data = responseData;
          apiData.StatusCode = response.statusCode;
          return apiData;
        } else {
          apiData.Message = "No Internet Access";
          apiData.IsSuccess = false;
          apiData.Data = 0;
          apiData.StatusCode = response.statusCode;
          return apiData;
        }
      } catch (e) {
        String message = e.toString();
        if (e.toString().contains("hostname")) message = "Server Error";
        apiData.Message = message;
        apiData.IsSuccess = false;
        apiData.StatusCode = 0;
        apiData.Data = 0;

        return apiData;
      }
    }
  }

  static Future<APIDataClass> postApi(String apiName, body) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(
      Message: 'No Data',
      IsSuccess: false,
      Data: '0',
    );
    //Check For Internet
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('$connectivityResult *********');
    if (connectivityResult == ConnectivityResult.none) {
      apiData.Message = "No Internet Access";
      apiData.IsSuccess = false;
      apiData.Data = 0;
      return apiData;
    } else {
      String url = apiUrl + '$apiName';
      print("$apiName : " + url);

      try {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        //String authToken = pref.getString(Session.authToken);
        String authToken = storage.read(Session.authToken);

        // if (authToken == null || authToken == "") authToken = loginToken;

        dio.options.headers["Authorization"] = "Bearer $authToken";

        dio.options.headers['Accept'] = 'application/json';
        // dio.options.headers['Content-Type'] = 'application/json';

        print("authToken----");
        print(authToken);

        final response = await dio.post(url, data: body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          //get response
          var responseData = response.data;
          //set data to class

          apiData.Message = responseData["Message"];
          apiData.IsSuccess = responseData["IsSuccess"];
          apiData.Data = responseData;
          apiData.StatusCode = response.statusCode;

          return apiData;
        } else {
          var responseData = response.data;
          apiData.Message = "No Internet Access";
          apiData.IsSuccess = false;
          apiData.Data = responseData;
          apiData.StatusCode = response.statusCode;
          return apiData;
        }
      } catch (e) {
        print(e.response.toString());
        if (e.response != null) {
          print(e.response.data.toString());
          // print(e.response.headers);
          //print(e.response.request);
        } else {
          print("select");
          // Something happened in setting up or sending the request that triggered an Error
          // print(e.request);
          // print(e.message);
        }
        String message = e.toString();
        if (e.toString().contains("hostname")) message = "Server Error";
        apiData.Message = message;
        apiData.IsSuccess = false;
        apiData.Data = e.response.data;
        apiData.StatusCode = e.response.statusCode;

        print(e.toString());

        return apiData;
      }
    }
  }
}
