import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'More/presentation/view/more_page.dart';
import 'home/presentation/view/home_page.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int selectedIndex = 0;
  List<Widget> screens = [
    HomePage(),
    MorePage(),
  ];

  void changeBottomNavBarIndex({required int newIndex}) {
    selectedIndex = newIndex;
    print("What is Selected Index $selectedIndex");
    emit(BottomNavBarChangeIndex());
  }
}
