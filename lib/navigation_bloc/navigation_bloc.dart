import 'package:bloc/bloc.dart';
import '../Pages/Construction.dart';
import '../Pages/Greenvegetable.dart';
import '../Pages/Tailor_page.dart';
import '../Pages/raddiwala.dart';
import '../Pages/Homepage.dart';
import '../Pages/Logout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

enum NavigationEvents {
  homepage_click,
  greenvegetable_click,
  tailor_click,
  construction_click,
  raddiwala_click,
  logout_click,
  setting_click,
  previous_click
}

abstract class NaviagtionStates {}

class Navigation_Bloc extends Bloc<NavigationEvents, NaviagtionStates> {
  Navigation_Bloc(NaviagtionStates initialState) : super(initialState);

  @override
  NaviagtionStates get initialState => Homepage();

  @override
  Stream<NaviagtionStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.homepage_click:
        yield Homepage();
        break;
      case NavigationEvents.greenvegetable_click:
        yield Greenvegetable();
        break;
      case NavigationEvents.tailor_click:
        yield Tailor();
        break;
      case NavigationEvents.construction_click:
        yield Construction();
        break;
      case NavigationEvents.raddiwala_click:
        yield Raddiwala();
        break;
      case NavigationEvents.logout_click:
        yield Logout();
        break;
      case NavigationEvents.setting_click:
        break;
      case NavigationEvents.previous_click:
        break;
    }
  }
}
