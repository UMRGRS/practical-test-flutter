import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getPokeList()async{
  http.Client client = http.Client();
  http.Response data;
  List<dynamic> pokeList = [];

  Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100&offset=0');

  try{
    data = await client.get(url);
    if (data.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(data.body.toString());
      pokeList = json["results"];
      return pokeList;
    }else{
      return pokeList;
    }
  }catch(error){
   return pokeList;
  }
}