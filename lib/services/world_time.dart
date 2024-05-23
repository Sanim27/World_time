import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location="";
  String time="";
  String flag="";
  String url="";
  bool isDayTime=false;

  WorldTime({this.location="",this.flag="",this.url=""});
  Future<void> getTime() async{
    try{
      Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);

      //get properties from data
      String datetime=data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);
      // print(datetime);
      //print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
      time=DateFormat.jm().format(now);
    }

    catch(e){
      print('caught error : $e');
      time="could not get time data";
    }

  }
}


