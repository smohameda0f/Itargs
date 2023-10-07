import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<BottomNavBarCubit>(context);
        return Scaffold(
          body: cubit.screens[cubit.selectedIndex],
          bottomNavigationBar: Container(
            height: 80.h,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: .1,
                  )
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                currentIndex: cubit.selectedIndex,
                onTap: (int newIndex) {
                  cubit.changeBottomNavBarIndex(newIndex: newIndex);
                },
                selectedItemColor: Colors.indigo,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: cubit.selectedIndex == 0? ImageIcon(AssetImage('Assets/Icons/Home@2x.png'),size: 26.h):
                    ImageIcon(AssetImage('Assets/Icons/Home_no selection@2x.png'),size: 26.h),
                    label: tr('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedIndex == 1? ImageIcon(AssetImage('Assets/Icons/More@2x.png'),size: 26.h,):
                    ImageIcon(AssetImage('Assets/Icons/More_not selected@2x.png'),size: 26.h,),
                    label: tr('More'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
