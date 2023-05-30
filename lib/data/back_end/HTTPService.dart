import 'package:dio/dio.dart';

class HTTPService{
  Dio _dio;
  HTTPService(this._dio);

  Future<T> get<T>(
      { String uri,
    Map<String, dynamic> queryParameters
  })async{
    try{
      return response = await _dio.get({
        String uri,
        queryParameters: queryparameters
      });
  }catch(e){
      return e
    }
}
      )
}