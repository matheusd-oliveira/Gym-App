import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      //drawer: getHomeDrawer(),
      //floatingActionButton: getHomeFab(),
      body: Container(),
    );
  }
}
