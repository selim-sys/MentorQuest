import 'package:http/http.dart' as http;
class Api {
  static final _api = Api._internal();
  factory Api(){
    return _api;
  }
  Api._internal();

  late String token;
  late String baseUrl = '192.168.1.10';
  late String path = 'api/v1';


  Future<http.Response> httpGet(String endPath,{Map<String,String>? query} ){
    Uri uri = Uri.https(baseUrl, '$path/$endPath');
    if (query != null){
       uri = Uri.https(baseUrl, '$path/$endPath',query);
      
    }
    return http.get(uri, headers: {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $token'
    } );
  }
  Future<http.Response> httpPost(String endPath,Object body ){
    Uri uri = Uri.https(baseUrl, '$path/$endPath');

    return http.post(uri,body: body, headers: {
      'Authorization' : 'Bearer $token',
      'Accept': 'application/json',
    } );
  }
}