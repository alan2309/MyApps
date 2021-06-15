import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget potrait() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 70.0,
          backgroundImage: AssetImage('images/profile.PNG'),
        ),
        Text(
          'Alankrit Arya',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 35.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'FLUTTER DEVELOPER',
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 20.0,
            color: Colors.teal[100],
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 150.0,
          child: Divider(
            color: Colors.teal[100],
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(Icons.phone, color: Colors.teal),
            title: Text(
              '+91 816 970 9842',
              style: TextStyle(
                color: Colors.teal[900],
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(Icons.email, color: Colors.teal),
            title: Text(
              'alankritarya@gmail.com',
              style: TextStyle(
                color: Colors.teal[900],
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget landscape() {
    return Center(
      child: Text(
        'Turn Your Phone to view details',
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: OrientationBuilder(builder: (context, orientaion) {
            if (orientaion == Orientation.portrait) {
              return potrait();
            } else {
              return landscape();
            }
          }),
        ),
      ),
    );
  }
}
