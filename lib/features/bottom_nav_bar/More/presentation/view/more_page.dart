
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags_task/features/bottom_nav_bar/More/presentation/view/more_cubit.dart';
import 'package:itrags_task/features/bottom_nav_bar/More/presentation/view/wedgits/settingsRow.dart';
import 'package:provider/provider.dart';

import '../view_model/settings_notifier.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool languageSwitch = false;

  @override
  Widget build(BuildContext context) {
    var settingsChange = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  tr('More'),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                )),
            SizedBox(
              height: 8.h,
            ),
            Divider(thickness: 1),
            SizedBox(
              height: 12.h,
            ),
            Padding(
                padding: context.locale.toString() == 'en'? EdgeInsets.only(left: 20):
                 EdgeInsets.only(right: 20),
                child: Text(
                  tr('Settings'),
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              thickness: 1,
            ),
            SettingsRow(text: tr('Dark Mode'),switchCase: settingsChange.darkTheme, switcher:
            (value){
              setState(() {
                settingsChange.darkTheme = value;
                // currentTheme.switchTheme();
              });
            }),
            Divider(thickness: 1,),
            SettingsRow(text:tr('Arabic Language'),switchCase: BlocProvider.of<MoreCubit>(context).arabicLang == 'ar', switcher:
                (value){
              setState(() {
                // settingsChange.changeLang(value, context);
                BlocProvider.of<MoreCubit>(context).changeLang(value, context);
              });
            }),
          ],
        ),
      ),
    );
  }
}
