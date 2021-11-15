import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_uber/src/global_widgets/logo_widget.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const LogoWidget(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/animations/login_page_animation.json',
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
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
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 90,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefix: const Text('+964 '),
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
                    SizedBox(
                      child: MaterialButton(
                          minWidth: 260,
                          height: 52,
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text('Login'),
                          onPressed: () {
                            //todo auth
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
