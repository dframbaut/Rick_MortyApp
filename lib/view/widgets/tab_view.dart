import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_bottom_bar/bottom_bar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> titles;
  final List<Icon> icons;
  
  final List<Function> ontaps;
  const CustomBottomNavigationBar(
      {super.key,
      required this.titles,
      required this.icons,
      required this.ontaps,
      });

  @override
  Widget build(BuildContext context) {
    final blocBottomBar = context.watch<BottomBarBloc>();
    return BottomNavigationBar(
        onTap: (value) {
          ontaps[value].call();           
        },
        currentIndex: blocBottomBar.state.pageIndex,
  
        items: [
          BottomNavigationBarItem(
              label: titles[0],
              activeIcon: icons[0],
              icon: icons[0]),
          BottomNavigationBarItem(
            label: titles[1],
            activeIcon: icons[1],
            icon: icons[1],
          ),
          BottomNavigationBarItem(
            label: titles[2],
            activeIcon: icons[2],
            icon: icons[2],
          )
        ]);
  }
}