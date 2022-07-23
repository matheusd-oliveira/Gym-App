import 'package:flutter/material.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

FloatingActionButton getHomeFab() {
  return FloatingActionButton(
    onPressed: () {},
    child: Text(
      '+',
      style: TextStyle(fontSize: 24),
    ),
    backgroundColor: CustomColors().getAppBarMainColor(),
  );
}
