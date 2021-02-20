import 'package:flutter/material.dart';

import '../ui/const.dart';

class SplashScreen extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: splashBg,
        ),
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  children: [
                    builHeaderPng(size),
                    SizedBox(
                      height: 25,
                    ),
                    buildCircle(size),
                    SizedBox(
                      height: 20,
                    ),
                    buildRasAndEa(),
                    SizedBox(
                      height: 5,
                    ),
                    buildCs(),
                    SizedBox(
                      height: 5,
                    ),
                    buildWieKokPes(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  builHeaderPng(Size size) {
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo/ieeelogo.png"),
              fit: BoxFit.cover)),
    );
  }

  buildCircle(Size size) {
    return Container(
      height: 250,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("Stuvent\nEtkinlik\nHabercisi",
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey.shade600,
                        ),
                      ],
                      fontSize: 40,
                      color: Color.fromRGBO(0, 102, 176, 1),
                      fontWeight: FontWeight.bold))),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 4,
                spreadRadius: 4,
                offset: Offset(0, 3))
          ]),
    );
  }

  buildRasAndEa() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/logo/beyazLogo/ras_w.png",
            height: 50,
            width: 135,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/logo/beyazLogo/ea_w.png",
            height: 110,
            width: 100,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  buildCs() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo/beyazLogo/cs_w.png",
            height: 45,
            width: 150,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  buildWieKokPes() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/logo/beyazLogo/wie_w.png",
            height: 60,
            width: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/logo/beyazLogo/pes_w.png",
            height: 75,
            width: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
