import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  ///name for the uI
  String time; //time in that location
  String flag;
  ///url to an asset flag icon
  String url;
  bool isDayTime;


  /// location url for endpoint
  ///
  WorldTime({this.location, this.flag, this.url});

  ///
  ///
  Future<void> getTime() async {
    try {
      //make request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      //-----------------------------------------------
      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(dateTime);
      //print(offset);
      //------------------------------------------------
      //create date time object
      DateTime now = DateTime.parse(dateTime);
      now.add(Duration(hours: int.parse(offset)));

      ///set the time to property
      isDayTime = now.hour > 6 && now.hour < 10 ? true : false;

      time = DateFormat.jm().format(now);

    } catch (e) {
      print ('error: $e');
      time = 'could not get the time ';
    }
  }
}
