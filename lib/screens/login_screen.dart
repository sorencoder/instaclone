import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/resources/auth_method.dart';
import 'package:instaclone/theme/colors.dart';
import 'package:instaclone/utils/util.dart';
import 'package:instaclone/widgets/text_fields.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void logInUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods()
        .loginUser(email: _email.text, password: _password.text);
    setState(() {
      _isLoading = false;
    });
    showSnackBar(context, res);

    // print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(0, 0, 0, 1),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            //svg image
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            //textfield for email
            TextFieldInput(
              hintText: 'Phone number, username, or email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _email,
            ),
            const SizedBox(
              height: 10,
            ),
            //textfield for password
            TextFieldInput(
              hintText: 'Password',
              textInputType: TextInputType.text,
              textEditingController: _password,
              isPass: true,
            ),
            const SizedBox(
              height: 10,
            ),
            //login
            ElevatedButton(
              onPressed: () => logInUser(),
              style: ElevatedButton.styleFrom(
                primary: blueColor, // Background color
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : const Text(
                      'Log in',
                      style: TextStyle(fontSize: 12),
                    ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(children: [
              const Expanded(child: Divider(thickness: 2, color: Colors.grey)),
              SizedBox(
                width: 10,
              ),
              const Text(
                "OR",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: Divider(
                thickness: 2,
                color: Colors.grey,
              )),
            ]),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: blueColor, // Background color
              ),
              child: const Text(
                'Login with Facebook',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(onTap: (() {}), child: const Text('Forgot password?')),
            const SizedBox(
              height: 20,
            ),
            const Text('Get the app'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Image.asset('assets/appStore.png')),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (() {}),
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Image.asset('assets/playStore.png')),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transition
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
