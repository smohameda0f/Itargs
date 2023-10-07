import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.switchCase, required this.switcher, required this.text});

  final bool switchCase;
  final void Function(bool) switcher;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(text,style: TextStyle(
              fontSize: 18.sp
          ),),
          Spacer(),
          FlutterSwitch(
            width: 50.w,
            height: 30.h,
            toggleSize: 20.0.h,
            borderRadius: 30.0,

            activeColor: Colors.white,
            inactiveColor: Colors.white,
            activeToggleColor: Colors.indigo,
            inactiveToggleColor: Colors.grey,
            value: switchCase,
            activeSwitchBorder: Border.all(
              color: Colors.indigo,
              width: 2.0.w,
            ),
            inactiveSwitchBorder: Border.all(
              color: Colors.grey,
              width: 2.0.w,
            ),
            onToggle: switcher,
          ),
        ],
      ),
    );
  }
}
