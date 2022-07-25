import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';
import 'package:gym_app/pages/home/home_widgets/home_content.dart';
import 'package:gym_app/pages/home/home_widgets/home_drawer.dart';
import 'package:gym_app/pages/home/home_widgets/home_fab.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeListModel> listModels = [
    HomeListModel(
      title: 'Academia - Monster Top Team',
      assetIcon: 'assets/dumbbell-semfundo.png',
    ),
    HomeListModel(
      title: 'Academia - Smart Fit',
      assetIcon: 'assets/dumbbell-semfundo.png',
    ),
    HomeListModel(
      title: 'Academia - IronBerg',
      assetIcon: 'assets/dumbbell-semfundo.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      floatingActionButton: getHomeFab(context, listModels, refreshPage),
      body: HomePageContent(listModels: listModels),
    );
  }

  refreshPage() {
    setState(() {});
  }
}
