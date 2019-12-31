import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:ganz_tek/data/model/login_entity.dart';
import 'package:ganz_tek/data/model/register_entity.dart';
import 'package:ganz_tek/data/service/api_service.dart';
import 'package:ganz_tek/data/service/dio_utils.dart';
import 'package:ganz_tek/data/service/http_api.dart';
import 'package:logger/logger.dart';

class Repository {
  void asyncRequestNetwork<T>(Method method, {@required String url, bool isShow : true, bool isClose: true, Function(T t) onSuccess, Function(List<T> list) onSuccessList, Function(int code, String msg) onError,
    dynamic params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options, bool isList : false}) {
    //if (isShow) view.showProgress();
    DioUtils.instance.asyncRequestNetwork<T>(method, url,
        params: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken?? null,
        isList: isList,
        onSuccess: (data) {
          //if (isClose) view.closeProgress();
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onSuccessList: (data) {
          //if (isClose) view.closeProgress();
          if (onSuccessList != null) {
            onSuccessList(data);
          }
        },
        onError: (code, msg) {
          //_onError(code, msg, onError);
        }
    );
  }

  static Future login(String username, String password) async {
    Map<String, String> params = Map();
    params["identifier"] = username;
    params["password"] = password;

    return DioUtils.instance.asyncRequestNetwork<LoginEntity>(Method.post, HttpApi.login,
        params: params,
        onSuccess: (data) {
          //if (isClose) view.closeProgress();
          if (data != null) {
            var logger = Logger();
            logger.e(data);
          }
        },
        onSuccessList: (data) {
          //if (isClose) view.closeProgress();
          if (data != null) {
            var logger = Logger();
            logger.e(data);
          }
        },
        onError: (code, msg) {
          var logger = Logger();
          logger.e("$msg code=$code");
          //_onError(code, msg, onError);
        }
    );

    /*
    var response = await http.post<Map>(HttpApi.login, data: {
      'identifier': username,
      'password': password,
    });
    return LoginEntity.fromJson(response.data);*/
  }

  static Future logout() async {
    var response = await http.post<Map>(HttpApi.login);
    return LoginEntity.fromJson(response.data);
  }

  static Future register(String username, String email, String password) async {
    var response = await http.post<Map>(HttpApi.register, data: {
      'username': username,
      'email'   : email,
      'password': password,
    });
    return RegisterEntity.fromJson(response.data);
  }

}
