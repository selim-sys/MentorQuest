

import 'package:consultation_gp/shared/constants.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://sobhdesign.com/api/v1',
        receiveDataWhenStatusError: true,
          validateStatus: (statusCode){
            if(statusCode == null){
              return false;
            }
            if(statusCode == 422||statusCode==401||statusCode==404){ // your http status code
              return true;
            }else{
              return statusCode >= 200 && statusCode < 300;
            }
          },
        // receiveTimeout: ,
        // connectTimeout: ,
      )
    );
  }


  static Future <Response> getData({

     required String url,
       Map<String,dynamic>? query,
     String? tkn

  })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $tkn'
    };
    return await dio.get(url,queryParameters: query);
  }


  static Future <Response> postData({

    required String url,
     Map<String,dynamic>? query,
      Map<String,dynamic>? data,
     String? tkn

  })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $tkn'

    };
    return await dio.post
      (
        url,
        queryParameters: query,
        data: data
      );
  }

  static Future <Response> deleteData({

    required String url,
    Map<String,dynamic>? query,
    String? tkn

  })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $tkn'
    };
    return await dio.delete(url,queryParameters: query);
  }






}