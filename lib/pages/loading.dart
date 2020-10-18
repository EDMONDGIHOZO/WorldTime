import 'package:flutter/material.dart';
import 'package:meteo_rwanda/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void SetUpWorldTime() async {
    WorldTime urugero = WorldTime(
        location: 'Berlin', flag: 'germany_png', url: 'Europe/Berlin');
    await urugero.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': urugero.location,
       'flag': urugero.flag,
       'time': urugero.time,
       'isDayTime': urugero.isDayTime
     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetUpWorldTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amberAccent,
     body: Center(
       child: SpinKitCubeGrid(
         color: Colors.black,
         size: 80.0,
       ),
     ),
    );
  }
}
