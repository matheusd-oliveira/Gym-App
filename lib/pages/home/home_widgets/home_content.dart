import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_item.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_model.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

class HomePageContent extends StatefulWidget {
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<HomeListModel> listMockedList = [
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors().getGradientMainColor(),
            CustomColors().getGradientSecondaryColor(),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: ListView.builder(
        itemCount: listMockedList.length,
        itemBuilder: (context, index) {
          return HomeListItem(
            homeListModel: listMockedList[index],
          );
        },
      ),
    );
  }
}
