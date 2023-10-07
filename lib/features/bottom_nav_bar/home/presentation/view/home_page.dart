import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/data/network/audio_api_service.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/presentation/view_model/home_state.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/presentation/view_model/home_view_model.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/presentation/view/wedgits/home_page_build_row.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

AnimationController? _animationIconController1;
AudioCache? audioCache;
AudioPlayer? audioPlayer;
Duration _duration = new Duration();
Duration _position = new Duration();
Duration _slider = new Duration(seconds: 0);
double? durationvalue;
bool issongplaying = false;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isPlayed = false;


  @override
  void initState(){
    super.initState();
    audioPlayer = AudioPlayer();
    
    // audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                      tr('This Is App'),
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                    )),
                SizedBox(
                  height: 12.h,
                ),
                Divider(thickness: 1),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                    padding:  context.locale.toString() == 'en'? EdgeInsets.only(left: 20):
                    EdgeInsets.only(right: 20),
                    child: Text(
                      tr('Top Likes'),
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return HomePageBuildRow(index: index,);
                  },
                  itemCount: 3,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                    padding: context.locale.toString() == 'en'? EdgeInsets.only(left: 20):
                    EdgeInsets.only(right: 20),
                    child: Text(
                      tr('Listen Audios'),
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      Consumer<HomeViewModel>(
                        builder: (context, value, child) {
                          // AudioApiService().getAudio();
                          return BlocBuilder<HomeViewModel, HomeState>(builder: (context, state){
                            print("stattttttttte$state");
                            isPlayed = value.isPlayed;
                            if (state is AudioLoading) {
                              return AbsorbPointer(
                                absorbing: true,
                                child: IconButton(
                                  constraints: BoxConstraints(
                                    maxHeight: 130,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                    });
                                  },
                                  icon: ImageIcon(AssetImage("Assets/Icons/loading.png"),
                                  // color: Colors.indigo,
                                  //   size: 80,
                                  ),
                                  //   value.isPlayed?
                                  // ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')):
                                  // ImageIcon(AssetImage('Assets/Icons/icPlay Copy@2x.png')),

                                  color: Colors.indigo,
                                  iconSize: 25.h,
                                ),
                              );
                            }else if (state is LoadingSuccess){
                              return IconButton(
                                constraints: BoxConstraints(
                                  maxHeight: 130.h,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlayed = !isPlayed;
                                    value.isPlayed = isPlayed;
                                  });
                                  value.isPlayed? value.playAudio():
                                  value.pauseAudio();
                                },
                                icon: ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')),
                                // value.isPlayed?
                                // ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')):
                                // ImageIcon(AssetImage('Assets/Icons/icPlay Copy@2x.png')),
                                color: Colors.indigo,
                                iconSize: 25.h,
                              );
                            } else if (state is PausingAudio) {
                              return IconButton(
                                constraints: BoxConstraints(
                                  maxHeight: 130,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlayed = !isPlayed;
                                    value.isPlayed = isPlayed;
                                  });
                                  value.isPlayed? value.playAudio():
                                  value.pauseAudio();
                                },
                                icon: value.isPlayed?
                                ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')):
                                ImageIcon(AssetImage('Assets/Icons/icPlay Copy@2x.png')),
                                iconSize: 25.h,
                                color: Colors.indigo,
                              );
                            }else if (state is LoadingFailed) {
                              return IconButton(
                                constraints: BoxConstraints(
                                  maxHeight: 130.h,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlayed = !isPlayed;
                                    value.isPlayed = isPlayed;
                                  });
                                  value.isPlayed? value.playAudio():
                                  value.pauseAudio();
                                },
                                icon: Icon(Icons.details,
                                color: Colors.indigo,
                                size: 25.h,),
                                // value.isPlayed?
                                // ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')):
                                // ImageIcon(AssetImage('Assets/Icons/icPlay Copy@2x.png')),

                                // color: Colors.indigo,
                              );
                            } else
                              return IconButton(
                                constraints: BoxConstraints(
                                  maxHeight: 130.h,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlayed = !isPlayed;
                                    value.isPlayed = isPlayed;
                                  });
                                  value.isPlayed? value.playAudio():
                                  value.pauseAudio();
                                },
                                icon: value.isPlayed?
                                ImageIcon(AssetImage('Assets/Icons/Pause@2x.png')):
                                ImageIcon(AssetImage('Assets/Icons/icPlay Copy@2x.png')),
                                iconSize: 25.h,
                                color: Colors.indigo,
                              );
                          });
                        },
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        tr('Play This'),
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            ),
          ),
        ),
      );
  }
}
