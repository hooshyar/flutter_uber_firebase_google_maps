import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_firebase_uber/src/global_widgets/logo_widget.dart';
import 'package:flutter_firebase_uber/src/home_page/home_page.dart';
import 'package:flutter_firebase_uber/src/style.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPin = false; // show pin or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const LogoWidget(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .requestFocus(FocusNode()); // to hide keyboard on tap outside
        },
        child: SizedBox(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/animations/login_page_animation.json',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 200,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Nostrud nisi fugiat non Lorem reprehenderit. Culpa est nisi duis laborum tempor cupidatat occaecat dolore.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                AnimatedCrossFade(
                    alignment: Alignment.bottomCenter,
                    firstChild: _phoneInput(),
                    secondChild: _pinInput(),
                    sizeCurve: Curves.easeInCirc,
                    crossFadeState: _showPin == false
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300)),
                SafeArea(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('Privacy Policy',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Terms of Service',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _phoneInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefix: Row(
                children: [
                  const Text('+964 '),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: VerticalDivider(
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
              hintText: '751 449 1008',
              prefixStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.grey[100]!,
                ),
              ),
            ),
            onChanged: (value) {},
          ),
        ),
        Container(
          child: MaterialButton(
              minWidth: 260,
              height: 52,
              color: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('Login'),
              onPressed: () {
                //todo auth
                setState(() {
                  _showPin = true;
                });
              }),
        ),
      ],
    );
  }

  // if show pin is true, show pin input
  _pinInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          height: 90,
          child: PinCodeTextField(
              appContext: context,
              length: 6,
              autoFocus: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldWidth: 40,
                fieldHeight: 50,
                inactiveColor: Colors.grey[300],
                activeColor: Colors.black,
                errorBorderColor: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderWidth: 0.7,
              ),
              onChanged: (value) {
                debugPrint('New value: $value');
                if (value.length == 6) {
                  if (value == '888888') {
                    debugPrint('Pin is correct');
                    Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName);
                  }
                }
              }),
        ),
        Container(
          child: MaterialButton(
              minWidth: 260,
              height: 52,
              color: mainColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('Verify'),
              onPressed: () {
                //todo check if pin is correct navigate to the HomeScreen else show error
              }),
        ),
      ],
    );
  }
}
