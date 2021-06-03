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
    var response = await http
        .get("https://mocki.io/v1/147986eb-2333-4bea-84b5-9216e07345ee");
    var responseObject = json.decode(response.body);
    return GetDataItem.getData(responseObject);
  }
}
