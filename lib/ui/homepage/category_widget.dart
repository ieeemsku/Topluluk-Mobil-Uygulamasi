import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app_state.dart';

import '../komiteler.dart';

class CategoryWidget extends StatelessWidget {
  final int categoryId;

  const CategoryWidget({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(categoryId);
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.15,
            width: width * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color:
                      isSelected ? Colors.grey.shade900 : Colors.grey.shade700,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "${komiteLogoPng[categoryId]}",
                    height: height * 0.15,
                    width: width * 0.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
