import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onbordingapp/Modules/signUpScreen/register_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/reusable componants.dart';
import '../loginScreen/login_page.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({this.image, this.body, this.title});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/onBoardingOne.png',
      title: 'Get food delivery to your doorstep asap',
      body:
          'We have young and professional delivery team that will bring your food on soon as possible to your doorstep',
    ),
    BoardingModel(
      image: 'images/onBoardingTwo.png',
      title: 'Buy Any Food from your favorite restaurant',
      body:
          'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
    ),
  ];

  bool isEnd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            GestureDetector(
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>  LoginScreen()),
                    ModalRoute.withName('/'),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xfffdebef)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '7',
                  style: TextStyle(
                    color: Color(0xffFF9800),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Krave',
                  style: TextStyle(
                    color: Color(0xff02a497),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ]),
          Expanded(

            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardingController,
              onPageChanged: (int index) {
                if (index == boarding.length -1) {
                  print('last');
                  setState(() {
                    isEnd == true;
                  });
                } else {
                  print('not last');
                  setState(() {
                    isEnd == false;
                  });
                }
              },
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Column(
            children: [
              SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ScrollingDotsEffect(
                    activeStrokeWidth: 3,
                    activeDotColor: Color(0xffffd1dc),
                    activeDotScale: 1.3,
                    maxVisibleDots: 5,
                    radius: 2,
                    spacing: 10,
                    dotHeight: 8,
                    dotWidth: 12,
                  )),
              SizedBox(
                height: 20,
              ),
              MainButton(
                onTabbed: () {
                  if (isEnd==true) {
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                               LoginScreen()),
                      ModalRoute.withName('/'),
                    );
                  } else if(isEnd==false) {
                    boardingController.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                myColor: Color(0xff009688),
                myStyle: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              DontHaveAccount(
                onPressed: (){
                  Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                   RegisterPage()),
                  ModalRoute.withName('/'),);
                },
                label: 'don\'t have an account !',
                btnLabel: 'Sign Up',
              ),
            ],
          )
        ]),
      ),
    );
  }
}






