import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_uber/src/map_widget/map_widget.dart';
import 'package:flutter_firebase_uber/src/style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  TextEditingController _fromTextEditingController = TextEditingController();
  TextEditingController _toTextEditingController = TextEditingController();

  HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            height: 40,
            width: 55,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: const DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.red,
                )
              ],
            ),
          ),
        ],
        leading: IconButton(
            icon: SvgPicture.asset('assets/images/Burger.svg'),
            onPressed: () => _key.currentState!.openDrawer()),
      ),
      drawer: Drawer(
          child: ListView(children: const <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(),
      ])),
      body: Stack(
        // to have a gradient behind the avatar and the burger menu
        children: [
          MapWidget(),
          Container(
              height: 110,
              width: double.infinity,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white10,
                  Colors.white.withOpacity(0.1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ))),
          _hoveringRideCard(context)
        ],
      ),
    );
  }

  _hoveringRideCard(context) {
    return Positioned(
      bottom: 150,
      left: 30,
      right: 30,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(children: [
          // from to input
          Expanded(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(
                                      top: 40.0, bottom: 38, left: 8),
                                  child: FDottedLine(
                                    color: Colors.grey,
                                    height: 80.0,
                                    strokeWidth: 2.0,
                                    dottedLength: 2.0,
                                    space: 2.0,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.stars_rounded,
                                  color: mainColor,
                                ),
                                padding: EdgeInsets.only(right: 10),
                              ),

                              //real time search or select from map
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: double.infinity,
                                  child: Text(
                                    'From: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Container(
                                child: TextField(
                                  controller: _fromTextEditingController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.stars_rounded,
                                  color: Colors.grey[800],
                                ),
                                padding: EdgeInsets.only(right: 10),
                              ),

                              //real time search or select from map
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: double.infinity,
                                  child: Text(
                                    'To: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Container(
                                child: TextField(
                                  controller: _fromTextEditingController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                            ],
                          )),
                        ],
                      ),
                    ],
                  ))),

          //service selection
          Expanded(
              flex: 6,
              child: Container(
                color: Colors.red,
              )),

          //order
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.amber,
              ))
        ]),
      ),
    );
  }
}
