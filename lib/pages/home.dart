import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments;
    if (routeData != null && routeData is Map<String, dynamic>) {
      data = data.isNotEmpty ? data : routeData ;
    }
    String bgImage=data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    Color? timeColor=data['isDayTime'] ? Colors.black : Colors.grey[300];
    Color? LocColor=data['isDayTime'] ? Colors.black : Colors.grey[300];
    Color? IconColor=data['isDayTime'] ? Colors.black : Colors.grey[300];
    print(data);
    Color? bgColor=data['isDayTime'] ? Colors.lightBlue[200] : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 90.0 , 0 , 0),
              child: Column(
                children: [
                  TextButton.icon(onPressed:() async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag']
                      };
                    });
                  } ,
                      icon:Icon(Icons.edit_location,
                      color: Colors.grey[100],
                      size: 50,
                      ),
                      label:Text('Edit Location',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: IconColor,
                      ),),

                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 40.0,
                          letterSpacing: 2.0,
                          color: LocColor,
                        ),
                      ),
            
            
                    ],
                  ),
                  SizedBox(height:190.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: timeColor,
                      fontSize: 66.0,
                      letterSpacing: 2.0,
                    ),
                  )
            
            
                ],
              ),
            ),
          )
      ),
    );
  }
}
