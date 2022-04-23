import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerCommonLayout extends Drawer {
  DrawerCommonLayout({Key? key})
      : super(
          key: key,
          child: Container(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Usuario'),
                  accountEmail: Text('email@email.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256_960_720.png'),
                  ),
                ),
                Builder(
                  builder: (context) => SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.computer_outlined),
                    title: const Text('Home'),
                    onTap: () {
                      print('você foi para outra pagina ');
                    }),
                ListTile(
                  leading: const Icon(Icons.note_add_outlined),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.library_books_outlined),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white38,
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                const Divider(color: Colors.black),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Home'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
}

Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
