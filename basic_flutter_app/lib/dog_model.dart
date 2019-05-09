import 'dart:convert';
import 'dart:io';

// This is the Dog object. It handles the creation of the Dog and all it's properties. No widgets here.
class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  // All dogs should start with a rating of 10 because they are good boys/girls.
  int rating = 10;

  Dog(this.name, this.location,
      this.description); //Calling the class on itself instantites the objects names and makes them final.

// Future (type), meaning it'll wait on something, async lets dart know that it may have to wait for something.
  Future getImageUrl() async {
    // We'll check for null, that way the app doesn't keep trying if nothing is there.
    // If there is an image, we don't have to get one.
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    // set up a try block in case of failure
    try {
      // Using dart's uri builder, we'll get the link to the dog image
      var uri = Uri.http('dog.ceo',
          '/api/breeds/image/random'); // This will issue an http request to get a random image from dog ceo
      var request = await http.getUrl(
          uri); // request the image, wait for it to come back and don't proceed until it returns
      var response = await request
          .close(); // whatever the response, close the request once the request returns
      var responseBody = await response
          .transform(utf8.decoder)
          .join(); // Decodes the incoming response

      // The dog.ceo API returns a JSON object with a propert called 'message', which is the image's URL.
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}
