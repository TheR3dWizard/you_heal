// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'utilities.dart';

class QuizPage extends StatefulWidget {
  final String quizType;
  const QuizPage({super.key, required this.quizType});

  @override
  State<QuizPage> createState() => _QuizPageState(quizType: quizType);
}

class _QuizPageState extends State<QuizPage> {
  String quizType;
  Map<String, dynamic> quizData = {
    "numqns": "7",
    "type": "simple",
    "Title":
        "Over the last 2 weeks, how often have you been bothered by the following problems?",
    "questions": [
      "Feeling nervous, anxious, or on edge",
      "Not being able to stop or control worrying",
      "Worrying too much about different things",
      "Trouble relaxing",
      "Being so restless that it is hard to sit still",
      "Becoming easily annoyed or irritable",
      "Feeling afraid as if something awful might happen"
    ],
    "options": [
      "Not at all",
      "Several days",
      "More than half the days",
      "Nearly every day"
    ],
    "weights": [0, 1, 2, 3],
    "ranges": [
      [0, 4],
      [5, 9],
      [10, 14],
      [15, 21]
    ],
    "results": [
      "Minimal Anxiety",
      "Mild Anxiety",
      "Moderate Anxiety",
      "Severe Anxiety"
    ]
  };
  int score = 0;
  int pointer = 0;
  _QuizPageState({required this.quizType});

  @override
  void initState() {
    super.initState();
    loadQuizData().then((value) {
      setState(() {
        quizData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 42, 28, 12),
            child: Text(
              quizData["Title"],
              style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w100),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: Divider(),
          ),
          Text(
            quizData["questions"][pointer],
            style: const TextStyle(
                fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w100),
          ),
        ],
      ),
      //appBar: AppBar(),
    );
  }
}
