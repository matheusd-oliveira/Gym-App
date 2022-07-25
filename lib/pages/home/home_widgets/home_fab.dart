// ignore_for_file: prefer_const_constructors, void_checks

import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_model.dart';
import 'package:gym_app/pages/home/home_widgets/home_modal_add.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

FloatingActionButton getHomeFab(
  BuildContext context,
  List<HomeListModel> listModels,
  Function functionRefresh,
) {
  return FloatingActionButton(
    child: Text(
      '+',
      style: TextStyle(fontSize: 24),
    ),
    backgroundColor: CustomColors().getAppBarMainColor(),
    onPressed: () {
      return showBarModalBottomSheet(
        context: context,
        builder: (context) => HomeModalAdd(
          listModels: listModels,
          functionRefresh: functionRefresh,
        ),
      );
    },
  );
}
