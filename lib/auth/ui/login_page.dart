import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quire_clone/core/colours.dart';
import 'package:quire_clone/auth/ui/password_recovery_page.dart';
import 'package:quire_clone/auth/ui/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: const Align(
          child: Text(
            'Log in',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kGreyColour,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: TextFormField(
                    controller: _emailController,
                    cursorColor: kGreenColour,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kGreenColour,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kGreyColour,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PasswordRecoveryPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kGreenColour,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: TextFormField(
                    controller: _passwordController,
                    cursorColor: kGreenColour,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kGreenColour,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kGreenColour,
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('Log in'),
                    ),
                  ),
                ),
                const OrDivider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: LoginButton(
                    text: 'Sign in with Google',
                    color: Colors.white60,
                    textColor: Colors.black45,
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: LoginButton(
                    text: 'Sign in with Apple',
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0, bottom: 8),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Don't have an account yet? ",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up. ',
                        style: TextStyle(
                          color: kGreenColour,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color textColor;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: color,
        elevation: 0,
        side: const BorderSide(width: 0.5, color: kGreyColour),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Align(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 48,
          ),
          child: Text('or',
              style: TextStyle(
                color: Colors.black45,
              )),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
