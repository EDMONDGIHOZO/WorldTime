import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    //set background
    String bgimage = data['isDayTime'] ? 'skyday.jpeg' : 'skynight.jpg';
    Color bgColor = data['isDayTime'] ? Colors.amberAccent : Colors.amber;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pics/$bgimage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              FlatButton.icon(
                  onPressed: ()  async {
                   dynamic results = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time': results['time'],
                       'location': results['location'],
                       'isDayTime': results['isDayTime'],
                       'flag' : results['flag']
                     };
                   });
                  },
                  icon: Icon(Icons.edit_location),
                   color: Colors.amberAccent,
                  label: Text('edit location')),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 2.0
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
