import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mooviapp/config/api.dart';
import 'package:mooviapp/models/movie.dart';

class Api {

  Future<List<Movie>>  discover() async {
    List<Movie> m = [];
    var url = Uri.parse(BASE_URL + '/discover/movie?api_key=' + addHeader(), );

    var r = await http.get(url);
    final json = jsonDecode(r.body) as Map<String, dynamic>;
    for (var i= 0; i < json['results'].length; i++) {
      m.add(Movie(original_title: json['results'][i]['original_title'], title: json['results'][i]['title'], backdrop_path: json['results'][i]['backdrop_path']));
    }
    return m;
  }

  static addHeader() {
    return API_KEY;
  }
}