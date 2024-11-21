import 'dart:convert';
import 'package:http/http.dart' as http;

class OmdbService {
  // api key
  final String apiKey = '65d86eae';

  // Function to fetch movies from a keyword
  Future<List<dynamic>> searchFlick(String query) async {
    final String url = 'http://www.omdbapi.com/?s=$query&page=1&apikey=$apiKey';

    try {
      // Format the url into a Uri object for http.get()
      http.Response response = await http.get(Uri.parse(url));

      // Check status code for successful request then convert into map
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);

        // Check the Response key is a truthy, then fetch the value of the Search key
        if (data['Response'] == 'True') {
          return data['Search'];
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (error) {
      print('An error occurred: $error');
      return [];
    }
  }

  // Function to fetch the details of a movie using its ImdbID
  Future fetchFlickDetails(String imdbID) async {
    final String url = 'http://www.omdbapi.com/?i=$imdbID&apikey=$apiKey';

    try {
      // Format the url into a Uri object for http.get()
      http.Response response = await http.get(Uri.parse(url));

      // Check status code for successful request then convert into map
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);

        // Check the Response key is a truthy, then fetch the data object
        if (data['Response'] == 'True') {
          return data;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (error) {
      print('An error occurred: $error');
      return [];
    }
  }
}
