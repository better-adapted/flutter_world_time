import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map?;
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0, 0,0),
            child: Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.edit_location),
                    //label: 'Edit location',
                    onPressed: ()
                      {
                        Navigator.pushNamed(context,'/location');
                      }
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data?['location'],
                      style: TextStyle(
                        fontSize: 29.0,
                        letterSpacing: 2.0,
                      )
                    )
                  ]
                ),
                SizedBox(height: 20.0),
                Text(
                  data?['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  )
                )
              ],
            ),
          ),
      ),
    );
  }
}
