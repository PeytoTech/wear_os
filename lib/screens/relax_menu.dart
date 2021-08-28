import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wear_os/screens/ambient_screen.dart';
import 'package:wear_os/screens/sound_screen.dart';
import 'package:wear_os/wear.dart';

const img = 'assets/images/';
List<String> screens = ['rain', 'forest', 'sunset', 'ocean'];

class RelaxView extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  RelaxView(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode) =>
          mode == Mode.active ? HomeRoute() : AmbientWatchFace(),
    );
  }
}

class HomeRoute extends StatelessWidget {
  soundBtn(sound, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlayRoute(sound: sound)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 8.8),
            child: Image.asset(
              'assets/icons/$sound.png',
              scale: 7,
            ),
          ),
          Text(sound.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, letterSpacing: 3.0))
        ],
      ),
    );
  }

  @override
  build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              img + 'bkgnd_2.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/outline_arrow.png',
                    color: Colors.grey,
                    scale: 4.3,
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'Back',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 40,
            width: width,
            child: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'SELECT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: ['rain','forest','sunset','ocean'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: soundBtn(i, context),
                      );
                    },
                  );
                }).toList(),
              ),
              // child: SingleChildScrollView(
              //   physics: const BouncingScrollPhysics(),
              //   child: Column(
              //     children: [
              //       soundBtn('rain', context),
              //       Container(
              //         margin: const EdgeInsets.only(top: 15),
              //         color: Colors.grey,
              //         height: 1,
              //         width: MediaQuery.of(context).size.width / 2,
              //       ),
              //       soundBtn('forest', context),
              //       Container(
              //         margin: const EdgeInsets.only(top: 10),
              //         color: Colors.grey,
              //         height: 1,
              //         width: MediaQuery.of(context).size.width / 2,
              //       ),
              //       soundBtn('sunset', context),
              //       Container(
              //         margin: const EdgeInsets.only(top: 10),
              //         color: Colors.grey,
              //         height: 1,
              //         width: MediaQuery.of(context).size.width / 2,
              //       ),
              //       soundBtn('ocean', context),
              //       const SizedBox(
              //         height: 40,
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
