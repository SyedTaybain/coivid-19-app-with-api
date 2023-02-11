
import 'dart:convert';

import 'package:covid_api_api/Models/World_states_model.dart';
import 'package:covid_api_api/Services/Utilities/app_url.dart';
import 'package:http/http.dart'as http;


class StatesServices{

  Future<WorldStatesModel> fecthWorldStatesModelRecord()async{

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("error");
    }

  }

  Future<List<dynamic>> countryListApi()async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
     data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      return data;
    }else{
      throw Exception("error");
    }

  }


}