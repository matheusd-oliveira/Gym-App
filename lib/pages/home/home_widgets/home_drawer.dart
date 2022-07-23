// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xff007fff)),
          accountName: Text('Matthew Silva'),
          accountEmail: Text('matthew@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              'MS',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text('Configurações'),
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_back_sharp,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text('Sair'),
        ),
      ],
    ),
  );
}
