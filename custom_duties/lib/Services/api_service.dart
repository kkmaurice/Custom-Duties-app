import 'package:custom_duties/Modals/modals.dart';
import 'package:http/http.dart' as http;

class RemoteServiece{
  static var client = http.Client();
  
  static Future<List<Products>> getData() async{
    var response =  await client.get(Uri.parse('http://softcodes.dev/tariffs/api/tariffs.php'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productFromJson(jsonString);
    }else{
      throw Exception('Failed to load data');
    }
  }
}