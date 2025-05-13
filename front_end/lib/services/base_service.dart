import 'package:front_end/utilities/api_utility.dart';
import 'package:http/http.dart' as http;

class BaseService {
  static Future<http.Response> get({
    required String path,
  }) async {
    var url = Uri.parse("$dataServiceRoot/$path");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      },
    );
    return response;
  }

  static Future<http.Response> post({
    required String path,
    required Object requestData,
  }) async {
    // final authToken = navigatorKey.currentContext!.read<BaseViewModel>().authToken;
    var url = Uri.parse("$dataServiceRoot/$path");
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      },
      body: requestData,
    );
    return response;
  }

  static Future<http.Response> put({
    required String path,
    required String id,
    required Object requestData,
  }) async {
    var url = Uri.parse("$dataServiceRoot/$path/$id");
    var response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      },
      body: requestData,
    );
    return response;
  }

    static Future<http.Response> delete({
    required String path,
    required String id,
  }) async {
    var url = Uri.parse("$dataServiceRoot/$path/$id");
    var response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      },
    );
    return response;
  }


  
}
