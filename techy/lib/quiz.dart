import 'package:flutter/material.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/models/questions.dart';
import 'package:techy/profile.dart';
import 'package:techy/search.dart';

final questions = [
  Question(
    question: "Who is blocksmc owner ?",
    options: [
      const Option(option: "iDhoom", isCorrect: false),
      const Option(option: "xImTaiG_", isCorrect: true),
      const Option(option: "Jinaaan", isCorrect: false),
      const Option(option: "Sadlly", isCorrect: false),
    ],
  ),
  Question(
    question: "Flutter Mentor ?",
    options: [
      const Option(option: "Rahaf", isCorrect: false),
      const Option(option: "Dhari", isCorrect: true),
      const Option(option: "Reem", isCorrect: false),
      const Option(option: "Moudhi", isCorrect: false),
    ],
  ),
  Question(
    question: "Who is blocksmc owner ?",
    options: [
      const Option(option: "iDhoom", isCorrect: true),
      const Option(option: "xImTaiG_", isCorrect: false),
      const Option(option: "Jinaaan", isCorrect: false),
      const Option(option: "Sadlly", isCorrect: false),
    ],
  ),
  Question(
    question: "Who is blocksmc owner ?",
    options: [
      const Option(option: "iDhoom", isCorrect: true),
      const Option(option: "xImTaiG_", isCorrect: false),
      const Option(option: "Jinaaan", isCorrect: false),
      const Option(option: "Sadlly", isCorrect: false),
    ],
  ),
  Question(
    question: "Who is blocksmc owner ?",
    options: [
      const Option(option: "iDhoom", isCorrect: true),
      const Option(option: "xImTaiG_", isCorrect: false),
      const Option(option: "Jinaaan", isCorrect: false),
      const Option(option: "Sadlly", isCorrect: false),
    ],
  ),
];

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionWidget(),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomeScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          SearchPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          profile(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text('Question $_questionNumber/${questions.length}'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: questions.length,
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final _question = questions[index];
                return buildQuestion(_question);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          question.question,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: OptionWidget(
              question: question,
              onClickedOption: (option) {
                if (question.isLocked) {
                  return;
                } else {
                  setState(() {
                    question.isLocked = true;
                    question.selectedOption = option;
                  });
                  _isLocked = question.isLocked;
                  if (question.selectedOption!.isCorrect) {
                    _score++;
                  }
                }
              }),
        ),
        _isLocked ? buildElvatedButton() : const SizedBox.shrink(),
        const SizedBox(height: 20),
      ],
    );
  }

  ElevatedButton buildElvatedButton() {
    return ElevatedButton(
        onPressed: () {
          if (_questionNumber < questions.length) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInExpo,
            );

            setState(() {
              _questionNumber++;
              _isLocked = false;
            });
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(score: _score)));
          }
        },
        child: Text(_questionNumber < questions.length
            ? 'Next Question'
            : 'See Results'));
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionWidget(
      {Key? key, required this.question, required this.onClickedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color)),
        child: Row(
          children: [
            Text(
              option.option,
              style: const TextStyle(fontSize: 20),
            ),
            getIconForOption(option, question)
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade200;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You got $score/${questions.length}"),
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => MyApp(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          SearchPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          profile(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
