import 'package:flutter/material.dart';
import 'package:lofi_music/widgets/counter_page.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'lofi_radio',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:Splash(),
          );
  }
}

class Splash extends StatefulWidget {
    @override
    SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
    Future checkFirstSeen() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool _seen = (prefs.getBool('seen') ?? false);

        if (_seen) {
        Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => CounterPage()));
        } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => IntroScreen()));
        }
    }

    @override
    void initState() {
        super.initState();
        new Timer(new Duration(seconds: 2), () {
        checkFirstSeen();
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child:Text("henlo"),
        ),
        );
    }
}


class IntroScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final screenwidth=MediaQuery.of(context).size.width;
      final screenheight=MediaQuery.of(context).size.height;

        return Scaffold(
          backgroundColor: Colors.black,
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Container(
                    child: Text('Welcome to the lofi radio app',
                      style: TextStyle(fontSize: screenheight*0.025,color: Colors.white),
                      ),
                    ),
                  SizedBox(height: screenheight*0.1,),
                  Container(
                    width: screenwidth*0.8,
                    child:Center(
                      child: Text('It plays new lofi beats \n with a minimal interfance and \n\n a satisying animation,\n\n\nIt does not play audio in the background \n to reduce smartphone usage',
                      style: TextStyle(color:Colors.white, ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight*0.1,),
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FlatButton(
                child: Text('Get Started',
                style: TextStyle(color: Colors.white),),
                onPressed: () {
                      Navigator.of(context).pushReplacement(
                           MaterialPageRoute(builder: (context) => CounterPage()));
                },
                ),
                  )
            ],
            ),
        ),
        );
    }
}
