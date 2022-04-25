import 'package:flutter/material.dart';

class AppBarCommonLayout extends AppBar {
  AppBarCommonLayout({Key? key})
      : super(
          key: key,
          titleSpacing: 0.10,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
              color: Colors.black,
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/aula-logo.png",
                fit: BoxFit.contain,
                height: 50,
              ),
            ],
          ),
        );
}
