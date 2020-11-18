import 'package:findthem/Pages/Greenvegetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../navigation_bloc/navigation_bloc.dart';

import 'sidebar.dart';

class sidebar_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Navigation_Bloc(Greenvegetable()),
        child: Stack(
          children: <Widget>[
            BlocBuilder<Navigation_Bloc, NaviagtionStates>(
              builder: (context, currentState) {
                return currentState as Widget;
              },
            ),
            sidebar(),
          ],
        ),
      ),
    );
  }
}
