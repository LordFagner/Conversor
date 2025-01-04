import 'dart:convert';

import 'package:http/http.dart' as Http;

class getResponse{


  Future <Map> tResponse(Uri request )async {

    Http.Response response = await Http.get(request);
    return jsonDecode(response.body);

  }




}