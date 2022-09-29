import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/select_screen.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget getButton() {
    if (_pageIndex != 2) {
      return Text("Next");
    }
    return Text("Get Started");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 20), backgroundColor: Colors.grey),
                  onPressed: () {
                    _pageIndex == 2
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectScreen()),
                          )
                        : _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                  },
                  child: getButton(),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Dot(isActive: index == _pageIndex),
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.grey : Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class onBoard {
  final String image, title;

  onBoard({required this.image, required this.title});
}

final List<onBoard> demo_data = [
  onBoard(
    image: "assets/images/logo.svg",
    title: "Find the item you've \nbeen looking for",
  ),
  onBoard(
    image: "assets/images/cart.svg",
    title: "Find the item you've \nbeen looking for",
  ),
  onBoard(
    image: "assets/images/phone.svg",
    title: "Find the item you've \nbeen looking for",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Techy",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey),
        ),
        Spacer(),
        SvgPicture.asset(
          image,
          height: 200,
          color: Colors.black,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        Spacer(),
      ],
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
