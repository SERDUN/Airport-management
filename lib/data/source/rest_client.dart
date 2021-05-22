library remote;

import 'dart:async';

import 'package:Aevius/config/env.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestClient {
  Dio dio = new Dio();
  Connectivity _connectivity;
  final String baseUrl;

  RestClient(this.baseUrl) {
    //dio.options.baseUrl = base_url[env];
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 30000; //30s
    dio.options.receiveTimeout = 30000;
    _connectivity = new Connectivity();
  }

  Future<Response> post(String path,
      {dynamic data, CancelToken cancelToken}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return new Response(statusCode: 400, data: {"noConnection": true});
    } else {
      try {
        Response response =
            await dio.post(path, data: data, cancelToken: cancelToken);
        print("URL:" +
            response.request.baseUrl +
            response.request.path +
            " - Response: " +
            response.data.toString());

        return response;
      } catch (e) {
        print(e);
        if (e is DioError) {
          if (e.response != null) {
            return e.response is String
                ? Response(statusCode: e.response.statusCode, data: {
                    "error": ["${e.response?.data ?? "Unknown error."}"]
                  })
                : e.response;
          } else {
            return new Response(statusCode: 400, data: {
              "error": ["Unknown error."]
            });
          }
        } else {
          return new Response(statusCode: 400, data: {
            "error": ["Unknown error."]
          });
        }
      }
    }
  }

  Future<Response> get(String path,
      {dynamic data,
      CancelToken cancelToken,
      Options options,
      Map<String, dynamic> param}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return new Response(statusCode: 400, data: {"noConnection": true});
    } else {
      try {
        Response response = await dio.get(path,
            cancelToken: cancelToken, options: options, queryParameters: param);
        print("URL:" +
            response.request.baseUrl +
            response.request.path +
            " - Response: " +
            response.data.toString());
        return response;
      } catch (e) {
        if (e is DioError) {
          if (e.response != null) {
            return (e.response.statusCode == 500)
                ? new Response(statusCode: e.response.statusCode, data: {
                    "error": ["${e.response.data}"]
                  })
                : e.response;
          } else {
            return new Response(statusCode: 400, data: {
              "error": ["Unknown error."]
            });
          }
        } else {
          return new Response(statusCode: 400, data: {
            "error": ["Unknown error."]
          });
        }
      }
    }
  }

  Future<Response> put(String path,
      {dynamic data, CancelToken cancelToken}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return new Response(statusCode: 400, data: {"noConnection": true});
    } else {
      try {
        Response response =
            await dio.put(path, data: data, cancelToken: cancelToken);
        print("URL:" +
            response.request.baseUrl +
            response.request.path +
            " - Response: " +
            response.data.toString());
        return response;
      } catch (e) {
        if (e is DioError) {
          if (e.response != null) {
            return (e.response.statusCode == 500)
                ? new Response(statusCode: e.response.statusCode, data: {
                    "error": ["${e.response.data}"]
                  })
                : e.response;
          } else {
            return new Response(statusCode: 400, data: {
              "error": ["Unknown error."]
            });
          }
        } else {
          return new Response(statusCode: 400, data: {
            "error": ["Unknown error."]
          });
        }
      }
    }
  }

  Future<Response> patch(String path,
      {dynamic data, CancelToken cancelToken}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return new Response(statusCode: 400, data: {"noConnection": true});
    } else {
      try {
        Response response =
            await dio.patch(path, data: data, cancelToken: cancelToken);
        print("URL:" +
            response.request.baseUrl +
            response.request.path +
            " - Response: " +
            response.data.toString());
        return response;
      } catch (e) {
        if (e is DioError) {
          if (e.response != null) {
            return (e.response.statusCode == 500)
                ? new Response(statusCode: e.response.statusCode, data: {
                    "error": ["${e.response.data}"]
                  })
                : e.response;
          } else {
            return new Response(statusCode: 400, data: {
              "error": ["Unknown error."]
            });
          }
        } else {
          return new Response(statusCode: 400, data: {
            "error": ["Unknown error."]
          });
        }
      }
    }
  }

  Future<Response> delete(String path,
      {dynamic data, CancelToken cancelToken}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return new Response(statusCode: 400, data: {"noConnection": true});
    } else {
      try {
        Response response =
            await dio.delete(path, data: data, cancelToken: cancelToken);
        print("URL:" +
            response.request.baseUrl +
            response.request.path +
            " - Response: " +
            response.data.toString());
        return response;
      } catch (e) {
        if (e is DioError) {
          if (e.response != null) {
            return (e.response.statusCode == 500)
                ? new Response(statusCode: e.response.statusCode, data: {
                    "error": ["${e.response.data}"]
                  })
                : e.response;
          } else {
            return new Response(statusCode: 400, data: {
              "error": ["Unknown error."]
            });
          }
        } else {
          return new Response(statusCode: 400, data: {
            "error": ["Unknown error."]
          });
        }
      }
    }
  }
}
