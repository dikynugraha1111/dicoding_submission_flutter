// @dart=2.9
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class GetDataItem {
  List data;

  GetDataItem({this.data});
  factory GetDataItem.getData(Map<String, dynamic> object) {
    return GetDataItem(
      data: object["data"],
    );
  }

  static Future<GetDataItem> connectToApi() async {
    var response = await http.get("https://dummyapi.io/data/api/user?limit=25",
        headers: {"app-id": "60adc999d31cd0ec106f8777"});
    var responseObject = json.decode(response.body);
    return GetDataItem.getData(responseObject);
  }
}
