// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_model.dart';

class HomeModalAdd extends StatefulWidget {
  final List<HomeListModel> listModels;
  final Function functionRefresh;
  HomeModalAdd({this.listModels, this.functionRefresh});

  @override
  State<HomeModalAdd> createState() => _HomeModalAddState();
}

class _HomeModalAddState extends State<HomeModalAdd> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Adicionar Academia',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Qual é o nome da Academia?',
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              ElevatedButton(
                onPressed: () {
                  addInList();
                },
                child: Text('Criar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addInList() {
    HomeListModel hml = HomeListModel(
      title: _nameController.text,
      assetIcon: "assets/dumbbell-semfundo.png",
    );
    setState(() {
      widget.listModels.add(hml);
    });

    widget.functionRefresh();

    Navigator.pop(context);
  }
}
