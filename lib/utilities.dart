// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selectable_container/selectable_container.dart';

class LabelledTextField extends StatelessWidget {
  final String label;
  TextEditingController? controller;
  bool? enabled;
  //final Function(String) subFunction;
  LabelledTextField({
    super.key,
    required this.label,
    //required this.subFunction
  });

  LabelledTextField.readable({
    super.key,
    required this.label,
    required this.controller,
  });

  LabelledTextField.offOn({
    super.key,
    required this.label,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 5.0,
          ),
          labelText: label,
        ),
        controller: controller,
        enabled: enabled,
        //onSubmitted: subFunction,
      ),
    );
  }
}

class Bet extends StatefulWidget {
  final String name;
  final String pool;
  final String players;
  const Bet(
      {super.key,
      required this.name,
      required this.pool,
      required this.players});

  @override
  State<Bet> createState() =>
      _BetState(name: name, pool: pool, players: players);
}

class _BetState extends State<Bet> {
  String name;
  String pool;
  String players;

  _BetState({required this.name, required this.pool, required this.players});
  //TODO add on pressed function

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2),
        child: Container(
          width: 100,
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromARGB(160, 103, 155, 180),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(name),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(pool), Text(players)],
                ),
              )
            ],
          ),
        ));
  }
}

class Pill extends StatefulWidget {
  final bool selected;
  final String text;
  final VoidCallback? onPressed;
  const Pill(
      {super.key,
      required this.selected,
      required this.text,
      required this.onPressed});

  @override
  State<Pill> createState() =>
      _PillState(selected: selected, text: text, onPressed: onPressed);
}

class _PillState extends State<Pill> {
  bool selected;
  String text;
  VoidCallback? onPressed;
  _PillState(
      {required this.selected, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2),
            child: Container(
                width: 100,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(160, 103, 155, 180),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(text))));
  }
}

// Custom Functions

//Function to load bet objects from json

Future<List<dynamic>> loadBets() async {
  final String response = await rootBundle.loadString('assets/jsons/bets.json');
  final jsonData = await json.decode(response)['bets'];
  return jsonData;
}

Future<List<String>> loadSearchTerms() async {
  final String response = await rootBundle
      .loadString('assets/jsons/bets.json'); //change to api or different json
  final jsonData = await json.decode(response)['bets'];
  List<String> searchTerms = [];
  for (var bet in jsonData) {
    searchTerms.add(bet['name']);
  }
  return searchTerms;
}

Future<Map<String, dynamic>> loadQuizData() async {
  final String response = await rootBundle.loadString('assets/jsons/quiz.json');
  Map<String, dynamic> jsonFile = json.decode(response);
  return jsonFile;
}

String font() {
  return 'Poppins';
}
