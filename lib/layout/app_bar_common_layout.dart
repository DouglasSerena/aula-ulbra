import 'package:flutter/material.dart';

class AppBarCommonLayout extends AppBar {
  bool back;

  AppBarCommonLayout({
    Key? key,
    this.back = false,
  }) : super(
          key: key,
          titleSpacing: 0.10,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) {
              if (back) {
                return IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                );
              }
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
                color: Colors.black,
              );
            },
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.computer_outlined),
                  title: const Text('Salas virtuais'),
                  onTap: () {
                    // navigator.push()
                  }),
              Image.asset(
                "assets/images/aula-logo.png",
                fit: BoxFit.contain,
                height: 43,
              ),
            ],
          ),
        );
}
