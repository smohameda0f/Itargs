import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags_task/features/bottom_nav_bar/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePageBuildRow extends StatefulWidget {
  HomePageBuildRow({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<HomePageBuildRow> createState() => _HomePageBuildRowState();
}

class _HomePageBuildRowState extends State<HomePageBuildRow> {
  bool? isFLiked ;
  bool? isSLiked ;
  bool? isTLiked ;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        isFLiked = value.isFLiked;
        isSLiked = value.isSLiked;
        isTLiked = value.isTLiked;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: [
                  Text(tr('Sample Text'), style: TextStyle(fontSize: 20.sp)),
                  Spacer(),
                  widget.index == 2
                      ? Column(
                    children: [
                      IconButton(
                              constraints: BoxConstraints(
                                maxHeight: 130.h,
                              ),
                              onPressed: () {
                                setState(() async {
                                  isTLiked = !isTLiked!;
                                  // await value.homePreference.getTLiked();
                                  value.isTLiked = isTLiked!;
                                });
                              },
                              icon: value.isTLiked
                                  ? ImageIcon(
                                      AssetImage(
                                          'Assets/Icons/Like_FIlled@2x.png'),
                                      color: Colors.red,
                                    )
                                  : ImageIcon(
                                      AssetImage('Assets/Icons/Like@2x.png'),
                                      color: Colors.red,
                                    ),
                        iconSize: 25.h,
                            ),
                            Divider(),
                    ],
                  )
                      : Column(
                    children: [
                      IconButton(
                        constraints: BoxConstraints(
                          maxHeight: 130.h,
                        ),
                        onPressed: () {
                          setState(() {
                            isFLiked = !isFLiked!;
                            isSLiked = !isSLiked!;
                            widget.index == 0
                                ? value.isFLiked = isFLiked!
                                : value.isSLiked = isSLiked!;
                          });
                        },
                        icon: widget.index == 0
                            ? value.isFLiked
                            ? ImageIcon(
                          AssetImage(
                              'Assets/Icons/Like_FIlled@2x.png'),
                          color: Colors.red,
                        )
                            : ImageIcon(
                          AssetImage('Assets/Icons/Like@2x.png'),
                          color: Colors.red,
                        )
                            : value.isSLiked
                            ? ImageIcon(
                          AssetImage(
                              'Assets/Icons/Like_FIlled@2x.png'),
                          color: Colors.red,
                        )
                            : ImageIcon(
                          AssetImage('Assets/Icons/Like@2x.png'),
                          color: Colors.red,
                        ),
                        iconSize: 25.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Divider(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
