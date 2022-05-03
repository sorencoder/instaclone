import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/resources/auth_method.dart';
import 'package:instaclone/theme/colors.dart';
import 'package:instaclone/utils/util.dart';
import 'package:instaclone/widgets/text_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _name = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _bio.dispose();
    _username.dispose();
  }

  void singUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _email.text,
        password: _password.text,
        username: _username.text,
        name: _name.text);
    print(res);
    setState(() {
      _isLoading = false;
    });

    showSnackBar(context, res);
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
            const SizedBox(
              height: 20,
            ),

            const Text(
              'Sign up to see photos and videos from your friends',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
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
              height: 20,
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
              height: 20,
            ),

            //textfield for username
            TextFieldInput(
              hintText: 'Mobile Number or Email',
              textInputType: TextInputType.text,
              textEditingController: _email,
            ),
            const SizedBox(
              height: 10,
            ),

            //textfield for email
            TextFieldInput(
              hintText: 'Full Name',
              textInputType: TextInputType.emailAddress,
              textEditingController: _name,
            ),
            const SizedBox(
              height: 10,
            ),

            //bio
            TextFieldInput(
              hintText: 'Username',
              textInputType: TextInputType.text,
              textEditingController: _username,
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
              onPressed: () => singUpUser(),
              style: ElevatedButton.styleFrom(
                primary: blueColor, // Background color
              ),
              child: !_isLoading
                  ? const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 12),
                    )
                  : const CircularProgressIndicator(
                      color: primaryColor,
                    ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('By signing up, you agree to our'),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'Terms',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(','),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'Data Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text('and'),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'Cookies Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(
              height: 12,
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
                  child: const Text("Already have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      "Log in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
