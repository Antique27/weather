import 'package:http/http.dart' as http;
import 'dart:convert';

class network {
  final String url;
  network(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
