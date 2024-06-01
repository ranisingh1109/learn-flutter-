import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unsplash_project/unsplash_model.dart';

class UnsplashServices {
  var headers = {
    "Authorization":"Client-ID 2z1vO2MR0w9YdXI_AL8uUrZuyplHTyWXRqCNsAmcOXs"
        // 'Basic ${base64Encode(utf8.encode('${'2z1vO2MR0w9YdXI_AL8uUrZuyplHTyWXRqCNsAmcOXs'}:${'OOHDum4BdH3GlparsANKBl2A9ouIB7yt2S8mycxIrXo'}'))}'
  };

  Future<List<UnsplashModel>> getData() async {
    var response = await http.get(Uri.parse("https://api.unsplash.com/photos"),headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)as List;
      var getdata =data.map((json) => UnsplashModel.fromJson(json)).toList() ;
      return getdata;
    } else {
      return [];
    }
  }
}
