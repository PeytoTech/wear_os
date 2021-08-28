import 'package:flutter/material.dart';
import 'package:wear_os/screens/ambient_screen.dart';
import 'package:wear_os/screens/relax_menu.dart';
import 'package:wear_os/wear.dart';

class NameScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  NameScreen(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode) => mode == Mode.active
          ? NameScreenUI(screenHeight, screenWidth)
          : AmbientWatchFace(),
    );
  }
}

class NameScreenUI extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  NameScreenUI(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff666666),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/outline_arrow.png',
                      color: Colors.black45,
                      scale: 4.3,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      'Back',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 5),
              Text(
                'Relaxing App',
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xffe3f8fc),
                ),
              ),
              const SizedBox(height: 5),
              RaisedButton(
                highlightColor: Colors.black,
                elevation: 6.0,
                child: const Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xff95c9b0),
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
      ),
    );
  }
}
