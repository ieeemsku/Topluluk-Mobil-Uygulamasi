import 'package:flutter/material.dart';

import 'const.dart';

class Splash extends StatelessWidget {
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
              child: Column(
                children: [
                  builHeaderPng(size),
                  SizedBox(
                    height: 25,
                  ),
                  buildCircle(size),
                  buildRasAndEa(),
                  buildCs(),
                  buildWieKokPes(),
                ],
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
              image: AssetImage("assets/png/ieeemsku.png"), fit: BoxFit.cover)),
    );
  }

  buildCircle(Size size) {
    return Container(
      height: 270,
      width: 270,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/png/ras.png",
          height: 50,
          width: 135,
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/png/ea.png",
          height: 110,
          width: 100,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  buildCs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/png/cs.png",
          height: 45,
          width: 150,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  buildWieKokPes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/png/wie.png",
          height: 75,
          width: 95,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 25,
        ),
        Image.asset(
          "assets/png/pes.png",
          height: 75,
          width: 100,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
