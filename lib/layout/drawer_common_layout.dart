import 'package:flutter/material.dart';

class DrawerCommonLayout extends Drawer {
  DrawerCommonLayout({Key? key})
      : super(
          key: key,
          child: Column(
            children: const [Text("Test")],
          ),
        );
}
