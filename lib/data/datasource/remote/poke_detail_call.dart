import 'dart:convert';

import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> getPokeInfo() async{
  http.Client client = http.Client();
  http.Response data;
  Map<String, dynamic> pokeData = {};

  Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/1/');

  try{
    data = await client.get(url);
    if (data.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(data.body.toString());
      pokeData["abilities"] = json["abilities"];
      pokeData["moves"] = json["moves"];
      pokeData["name"] = json["name"];
      pokeData["image"] = json["sprites"]["other"]["home"]["front_default"];
      return pokeData;
    }else{
      return pokeData;
    }
  }catch(error){
    return pokeData;
  }
}