import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quire_clone/core/colours.dart';
import 'package:quire_clone/auth/ui/login_page.dart';
import 'package:quire_clone/auth/ui/sign_up_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        isProgress: !isLastPage,
        onChange: (index) {
          if (index == 4) {
            setState(() {
              isLastPage = !isLastPage;
            });
          }
          if (index != 4 && isLastPage) {
            setState(() {
              isLastPage = !isLastPage;
            });
          }
        },
        globalFooter: isLastPage
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 16,
                        left: 16,
                        right: 4,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kGreenColour,
                          elevation: 0,
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 16,
                        left: 4,
                        right: 16,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          side: const BorderSide(
                            color: kGreenColour,
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: kGreenColour,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        dotsDecorator: const DotsDecorator(
          activeColor: kGreenColour,
          color: Colors.white,
          shape: CircleBorder(
            side: BorderSide(
              color: kGreenColour,
            ),
          ),
        ),
        next: const Text(
          'Next',
          style: TextStyle(
            color: kGreenColour,
          ),
        ),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        showDoneButton: false,
        pages: [
          PageViewModel(
            title: '',
            bodyWidget: const OnboardingPage(
              headerText: 'Welcome to Quire.',
              subText: 'Unfold your ideas.',
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: const OnboardingPage(
              headerText: 'From start to finish',
              subText: 'Swipe left or right to complete, delete or add a task.',
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: const OnboardingPage(
              headerText: 'Streamline your workflow',
              subText: 'Focus on selected tasks with Kanban board.',
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: const OnboardingPage(
              headerText: 'Map out timeline',
              subText: 'Plan ahead with a versatile Gantt chart.',
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: const OnboardingPage(
              headerText: 'Get into action',
              subText:
                  'Add assignees, tags, due dates, etc., to get started with your project.',
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.headerText,
    required this.subText,
  }) : super(key: key);

  final String headerText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Placeholder(),
        Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 56,
          ),
          child: Text(
            subText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
