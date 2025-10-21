import 'dart:async';
import 'dart:convert';
 
import 'package:http/http.dart' as http;
 
import 'model.dart';
 
Future<Album> fetchAlbum() async {
  final id = "7lCDEYXw3mM";
  final key = "AIzaSyB-aa-gvLOKCL0xUY36IXqKp2Q7T37wFJI";
  final part = "snippet";
  //final part = "snippet,contentDetails,statistics,status"
   
  final url = Uri.parse('https://www.googleapis.com/youtube/v3/videos?id=${id}&key=${key}&part=${part}');
  final response = await http.get(url);
 
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}