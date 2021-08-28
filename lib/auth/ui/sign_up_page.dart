import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quire_clone/core/colours.dart';
import 'package:quire_clone/auth/ui/login_page.dart';
import 'package:quire_clone/auth/ui/submit_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Sign up',
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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Align(
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
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kGreenColour,
                          width: 1,
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SubmitPage(
                            email: _emailController.text,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('GET STARTED'),
                    ),
                  ),
                ),
                OrDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LoginButton(
                    text: 'Sign up with Google',
                    color: Colors.white60,
                    textColor: Colors.black45,
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LoginButton(
                    text: 'Sign up with Apple',
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 12,
                        ),
                        text: 'By signing up I agree to Quire ',
                        children: [
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Terms.',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Log in.',
                        style: TextStyle(
                          color: kGreenColour,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
