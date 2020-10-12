import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Pages/Greenvegetable.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:rxdart/subjects.dart';

import 'menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sidebar extends StatefulWidget {
  @override
  _sidebarState createState() => _sidebarState();
}

class _sidebarState extends State<sidebar>
    with SingleTickerProviderStateMixin<sidebar> {
  AnimationController _animationController;
  StreamController<bool> issidebaropen_streamcontroller;
  Stream<bool> issidebaropen_stream;
  StreamSink<bool> issidebaropen_sink;
  String username = "User";
  String email = "Email";

  final bool issidebaropen = true;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    issidebaropen_streamcontroller = PublishSubject<bool>();
    issidebaropen_stream = issidebaropen_streamcontroller.stream;
    issidebaropen_sink = issidebaropen_streamcontroller.sink;
    loaduserdetail();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    issidebaropen_streamcontroller.close();
    issidebaropen_sink.close();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isanimationCompleted = animationStatus == AnimationStatus.completed;

    if (isanimationCompleted) {
      issidebaropen_sink.add(false);
      _animationController.reverse();
    } else {
      issidebaropen_sink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: issidebaropen_stream,
        builder: (context, issidebaropen) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: issidebaropen.data ? 0 : -screenwidth,
            right: issidebaropen.data ? 0 : screenwidth - 45,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.deepPurple,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          title: Text(
                            username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            email,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 60,
                          color: Colors.white.withOpacity(0.3),
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        menu_item(
                            icon: Icons.home,
                            title: "Homepage",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.homepage_click);
                            }),
                        menu_item(
                            icon: Icons.lightbulb_outline,
                            title: "Vegetables",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.greenvegetable_click);
                            }),
                        menu_item(
                            icon: Icons.airport_shuttle,
                            title: "Raddiwala",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.raddiwala_click);
                            }),
                        menu_item(
                            icon: Icons.accessibility,
                            title: "Tailor",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.tailor_click);
                            }),
                        menu_item(
                            icon: Icons.business,
                            title: "Building Contractor",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.construction_click);
                            }),
                        menu_item(
                            icon: Icons.settings,
                            title: "Previous Orders",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.previous_click);
                            }),
                        Divider(
                          height: 60,
                          color: Colors.white.withOpacity(0.3),
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        menu_item(
                            icon: Icons.settings,
                            title: "Setting",
                            onclick: () {
                              onIconPressed();
                              BlocProvider.of<Navigation_Bloc>(context)
                                  .add(NavigationEvents.setting_click);
                            }),
                        menu_item(
                            icon: Icons.autorenew,
                            title: "Logout",
                            onclick: () async {
                              onIconPressed();
                              print("logout");
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("login");
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            }),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: Menuclipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Colors.deepPurple,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_arrow,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<bool> loaduserdetail() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.reload();
    setState(() {
      username = p.getString("name");
      email = p.getString("email");
    });
  }
}

class Menuclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.transparent;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
