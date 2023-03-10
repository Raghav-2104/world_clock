import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context)!.settings.arguments as Map;

    String BgImg=data['isDay']?'day.png':'night.png';
    Color? bgColor=data['isDay']?Colors.lightBlueAccent:Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$BgImg'),
              fit:BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon:Icon(Icons.edit_location,
                    color: Colors.black87,
                      size: 30.0,
                    ) ,
                  label: Text('Choose Location',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(
                        fontSize: 45.0,
                        letterSpacing: 2.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                  color: Colors.black87,
                ),)
              ],
            ),
          ),
        )
      ),
    );
  }
}
