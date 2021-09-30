import 'dart:convert';

import 'package:http/http.dart'as http;
class Network{
  String url = '';
  Network(this.url);
  Future getAccess() async{
    http.Response response = await http.get(Uri.parse(url));
    var data = response.body;
    return jsonDecode(data);
  }

}