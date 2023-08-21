import 'package:dio/dio.dart';

class dictclient {
  Dio dict = Dio();
  searchForWord({required String? query}) async {
    String dictURL = "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    try {
      var response = await dict.get(dictURL);
      print(
          'this is the respone form yej APi ${response.data[0]['meanings'][0]['definitions'][0]['definiton']}');
      return response.data[0]['meanings'][0]['definitions'][0]['definiton'];
    } catch (error) {
      print('some error during network call $error');
    }
  }
}
