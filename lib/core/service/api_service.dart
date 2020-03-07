import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_apps/core/model/travel_response.dart';

class ApiService {


  Future<TravelResponse> getTravelData() async {

    String url = 'http://www.erporate.com/bootcamp/jsonBootcamp.php';
    try{
      print('starting to hit : $url');
      ///hit api
      final response = await http.get(url);

      if(response.statusCode == 200){
        ///berhasil
        print('status code : ${response.statusCode}');
        ///response
        print('response : ${response.body}');

        ///mapping hasil response yang sudah di decode ke dalam model
        Map json = jsonDecode(response.body);
        TravelResponse resp = TravelResponse.fromJson(json);
        return resp;
      }else{
        ///gagal
        print('status code : ${response.statusCode}');
        print('failed');

      }
    }catch(e){
      print(e.toString());
    }



  }

}