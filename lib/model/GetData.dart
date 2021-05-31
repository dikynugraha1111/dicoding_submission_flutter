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
        .get("https://mocki.io/v1/b419c87c-668b-47c1-b070-3be1868bb285");
    var responseObject = json.decode(response.body);
    return GetDataItem.getData(responseObject);
  }
}
