// ignore_for_file: missing_required_param, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text('Minhas Academias'),
    backgroundColor: Color(0xff007fff), // 0xff = #
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
      ),
    ],
  );
}
