import 'package:flutter/material.dart';

const headerText = TextStyle(
    fontFamily: "Ubuntu",
    color: Colors.white,
    fontSize: 45,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 8.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);

const miniHeader = TextStyle(
    fontFamily: "Catamaran",
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 10.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);

const indigoButton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(74, 78, 216, 1),
      Color.fromRGBO(138, 149, 243, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ]);

const loginPageBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.6,
      0.9
    ],
    colors: [
      Color.fromRGBO(0, 5, 161, 1),
      Color.fromRGBO(138, 149, 243, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ]);

const createAccBg =  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(255, 255, 252, 1),
      Color.fromRGBO(255, 241, 151, 1),
      Color.fromRGBO(250, 164, 26, 1),
    ]);
    const orangeButton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(255, 255, 252, 1),
      Color.fromRGBO(255, 241, 151, 1),
      Color.fromRGBO(250, 164, 26, 1),
    ]);