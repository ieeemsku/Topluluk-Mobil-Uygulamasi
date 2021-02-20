import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/ui/Login/login.dart';
import 'package:stuventmobil/ui/homepage/home_page.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import 'splash_screen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context,
        listen:
            true); // "listen" default olarak "true " kabul edildigi icin bunu yazmaya da bilisiniz
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return LoginPage();
      } else {
        return HomePage();
      }
    } else {
      return SplashScreen();
    }
  }
}
