import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
//  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  customHeader(),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    margin: const EdgeInsets.only(bottom: 130),
//                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
//                          margin: const EdgeInsets.only(top: 275),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/gabi.png')),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 9,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
//                          margin: const EdgeInsets.only(top: 275),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/vera.png')),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 9,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
//                          margin: const EdgeInsets.only(top: 275),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/regina.png')),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 9,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              //            CustomBottomBar(),
              //            PlayButton(),
            ],
          ),
        ),
      ),
    );
  }
}

customHeader() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      headerBackground(),
      Container(
        alignment: Alignment.center,
        height: 460,
        padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
//        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white54,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white54,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 25),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: '',
                  style: TextStyle(fontSize: 35),
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: TextStyle(fontSize: 16, color: Colors.white70))
                  ]),
            ),
            const Spacer(),
            const Text(
              '',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 150,
              height: 2,
            ),
          ],
        ),
      ),
      Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(top: 275),
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/oa.png')),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    ],
  );
}

headerBackground() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(top: 275),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 100,
              spreadRadius: 20,
              color: Colors.blueGrey.shade800)
        ]),
      ),
      ClipPath(
        clipper: HeaderClipper(),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          height: 450,
          color: Colors.white,
        ),
      ),
      ClipPath(
        clipper: HeaderClipper(),
        child: Container(
          height: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fundo.png'), fit: BoxFit.cover),
          ),
/*
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
*/
        ),
      ),
    ],
  );
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: IgnorePointer(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.01),
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: BottomBarClipper(),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blueGrey.shade800,
                      Colors.blueGrey.shade800,
                      Colors.blue.shade800,
                      Colors.blue.shade300,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: ClipPath(
                  clipper: BottomBarClipper(),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: double.infinity,
                    padding: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blueGrey.shade100,
                          Colors.blueGrey.shade100,
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Text(
                          '2.30',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Rainforest - Relaxing',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '-0.50',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 55,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey.shade900,
              Colors.blue.shade700,
            ],
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_arrow,
              color: Colors.white.withOpacity(0.9), size: 40),
        ),
      ),
    );
  }
}
/*
nuevo() {
  Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('assets/dog.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
      ),
    ),
  );
}
*/