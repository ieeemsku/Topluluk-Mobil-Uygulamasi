import 'package:flutter/material.dart';

const headerText = TextStyle(
    fontFamily: "Ubuntu",
    color: Colors.white,
    fontSize: 40,
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
    fontSize: 15,
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
      Color.fromRGBO(74, 78, 217, 1),
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
      Color.fromRGBO(201, 206, 251, 1),
    ]);

const createAccBg = LinearGradient(
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
      Color.fromRGBO(232, 234, 242, 1),
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

var butonBorder = BorderRadius.circular(10);

var new_event_color = Color.fromRGBO(30, 227, 167, 1);

const new_event_color_button = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.4,
      0.8,
      
    ],
    colors: [
      Color.fromRGBO(30, 227, 167, 1),
      Color.fromRGBO(220, 247, 239, 1),
      
    ]);

    const blueBotton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.7,
      0.9
  
    ],
    colors: [
      Color.fromRGBO(0, 150, 183, 1),
      Color.fromRGBO(141, 211, 212, 1),
      Color.fromRGBO(141, 211, 225, 1),

    ]);