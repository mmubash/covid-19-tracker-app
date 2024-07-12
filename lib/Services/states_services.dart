import 'dart:convert';


import 'package:covid_19_tracker/Models/countries_list_model.dart';
import 'package:covid_19_tracker/Models/world_states_model.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker/Services/Utilities/app_urls.dart';

class StatesServices
{
  static Future<WorldStatesModel?> fetchWorldStatesRecord() async{
    var url = Uri.parse(AppUrl.worldStatesApi);
    var response =await http.get(url);
    var data = WorldStatesModel.fromJson(jsonDecode(response.body));
    if(response.statusCode ==200)
      {
        return data;
      }
    else{
      return null;
    }
  }

  static Future<List<CountryListModel>> fetchCountryList() async{

    var url = Uri.parse("https://disease.sh/v3/covid-19/countries");
    var response =await http.get(url);

    List<CountryListModel> countrylist =[];
    if(response.statusCode == 200) 
    {
      var data = await jsonDecode(response.body.toString());
      int i =0;
      for(var j in data)
      {
        countrylist.add(CountryListModel.fromJson(j));
      }
      return countrylist ;
    }
    else{
      return countrylist ;
    }

  }
}