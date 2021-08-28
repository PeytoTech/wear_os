import 'package:flutter/material.dart';
import 'package:wear_os/screens/name_screen.dart';
import 'package:wear_os/screens/relax_menu.dart';
import 'package:wear_os/utils.dart';
import 'package:wear_os/wear.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff666666),
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Text(
                    'WELCOME TO MY FLUTTER WEAR OS APP',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xffe3f8fc), fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  RaisedButton(
                    highlightColor: Colors.white30,
                    elevation: 6.0,
                    child: const Text(
                      'Let\'s Go',
                      style: TextStyle(color: Color(0xff0f7387), fontSize: 16),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RelaxView(screenHeight, screenWidth);
                      }));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
