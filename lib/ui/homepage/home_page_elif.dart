import 'package:flutter/material.dart';

import '../const.dart';
import 'details.dart';
import 'komiteler.dart';

class HomePage extends StatelessWidget {
  var size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(gradient: homePageBg),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              header(),
              SizedBox(
                height: 25,
              ),
              komiteHeader(),
              komiteler(size, context),
              SizedBox(
                height: 15,
              ),
              cevreText(),
              Container(
                  height: etkinliklerJpg.length * 350.0,
                  width: 320,
                  child: etkinlikler(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        Text(
          "Stuvent",
          style: headerText,
        ),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }

  Widget komiteHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Komiteler",
          style: headerText2,
        )
      ],
    );
  }

  Widget komiteler(Size size, context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: komiteIsimler.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.15,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "${komiteLogoPng[index]}",
                        height: size.height * 0.15,
                        width: size.width * 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  cevreText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Çevrenizdeki Etkinlikler",
          style: headerText2,
        ),
      ],
    );
  }

  Widget etkinlikler(context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            child: Column(
              children: [
                ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return DetailsPage(index: index,);
              }));
            },
            child: Hero(tag: "post" + index.toString(),
                                    child: Image.asset(
                "${etkinliklerJpg[index]}",
                height: 320,
                width: 320,
                fit: BoxFit.cover,
              ),
            ),
          )),
                SizedBox(
        height: 10,
                )
              ],
            ),
          );
      },
      itemCount: etkinliklerJpg.length,
    );
  }
}
