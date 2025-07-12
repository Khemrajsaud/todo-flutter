import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo/home/home.dart';
import 'package:todo/introduction/start_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(context) {
  //   Navigator.of(
  //     context,
  //   ).pushReplacement(MaterialPageRoute(builder: (_) => const StartScreen()));
  // }

  void _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingDone', true);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const StartScreen()),
      (route) => false,
);
}

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      allowImplicitScrolling: true,
      autoScrollDuration: 4000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('images/landing.png', 100),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('logo/logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Manage Your Task",
          body:
              "You can easily manage all of your daily tasks in DoMe for free.",
          image: _buildImage('images/landing.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Create daily routine",
          body:
              "In Uptodo  you can create your personalized routine to stay productive.",
          image: _buildImage('images/landinge.png'),
          decoration: pageDecoration,
        ),
      
        PageViewModel(
          title: "Orgonaize your tasks ",
          body:
              "You can organize your daily tasks by adding your tasks into separate categories",
          image: _buildImage('images/landing2.png'),
          footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Welcome to UpTodo",
          body:
              "Please login to your account or create new account to continue",

          footer: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8875FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to create account
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF8875FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(fontSize: 16, color: Color(0xFF8875FF)),
                  ),
                ),
              ),
            ],
          ),

          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          // image: _buildImage('logo/logo.png'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
