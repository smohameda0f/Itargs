import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags_task/features/bottom_nav_bar/More/presentation/view/more_cubit.dart';
import 'package:itrags_task/features/bottom_nav_bar/bottom-nav-bar.dart';
import 'package:provider/provider.dart';
import 'features/bottom_nav_bar/home/presentation/view_model/home_view_model.dart';
import 'features/bottom_nav_bar/More/presentation/view_model/settings_notifier.dart';
import 'features/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'features/splash/splash_screen.dart';
import 'features/utils/style.dart';


void main() async {
  runApp(
      ChangeNotifierProvider(create: (BuildContext context) {
    return SettingsProvider();
  },
  child: EasyLocalization(
      path: 'Assets/translations',
      supportedLocales: const [Locale('ar'), Locale('en')],
      fallbackLocale: Locale('ar'),
      startLocale: Locale('en'),
      child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SettingsProvider settingsProvider = SettingsProvider();
  HomeViewModel homeProvider = HomeViewModel();
  // LanguageProvider langProvider = LanguageProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    getLikedItems();
  }

  void getCurrentAppTheme() async {
    settingsProvider.darkTheme =
    await settingsProvider.settingsPreference.getTheme();
  }

  void getLikedItems() async {
    homeProvider.isFLiked =
    await homeProvider.homePreference.getFLiked();
    homeProvider.isSLiked =
    await homeProvider.homePreference.getSLiked();
    homeProvider.isTLiked =
    await homeProvider.homePreference.getTLiked();
  }

  @override
  Widget build(BuildContext context) {
    // var themeChange = Provider.of<DarkThemeProvider>(context);
    return MultiProvider(
        providers: [
    BlocProvider<BottomNavBarCubit>(
    create: (BuildContext context) => BottomNavBarCubit(),
    ),
          BlocProvider<HomeViewModel>(
    create: (BuildContext context) => HomeViewModel(),
    ),
          BlocProvider<MoreCubit>(create: (BuildContext context) => MoreCubit()),
     ChangeNotifierProvider(
    create: (BuildContext context) {
    return HomeViewModel();
    }),
    ],
            child: Consumer<SettingsProvider>(
              builder: (context, value, child) {
                  return ScreenUtilInit(
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      theme: Styles.themeData(value.darkTheme, context),
                      home: SplashScreen(),
                    ),
                  );
              }),
        );
  }
}
