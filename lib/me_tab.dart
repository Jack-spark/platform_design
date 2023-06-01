// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';


import 'me_detail_tab.dart';
import 'utils.dart';
import 'widgets.dart';

class MeTab extends StatefulWidget {
  static const title = 'Me';
  static const androidIcon = Icon(Icons.music_note);
  static const iosIcon = Icon(CupertinoIcons.setting_circled);

  const MeTab({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<MeTab> createState() => _MeTabState();
}

class _MeTabState extends State<MeTab> {
  static const _itemsLength = 50;

  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> meNames;
  List<bool> containerStates = [true, false, false];

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    colors = getRandomColors(_itemsLength);
    meNames = getRandomNames(_itemsLength);
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
      () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return Container();

    // Show a slightly different color palette. Show poppy-ier colors on iOS
    // due to lighter contrasting bars and tone it down on Android.
    final color = defaultTargetPlatform == TargetPlatform.iOS
        ? colors[index]
        : colors[index].shade400;

    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: index,
        child: HeroAnimatingmeCard(
          me: meNames[index],
          color: color,
          heroAnimation: const AlwaysStoppedAnimation(0),
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => meDetailTab(
                id: index,
                me: meNames[index],
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePlatform() {//切换平台操作
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    } else {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    }

    // This rebuilds the application. This should obviously never be
    // done in a real app but it's done here since this app
    // unrealistically toggles the current platform for demonstration
    // purposes.
    WidgetsBinding.instance.reassembleApplication();
  }

  // ===========================================================================
  // Non-shared code below because:
  // - Android and iOS have different scaffolds
  // - There are different items in the app bar / nav bar
  // - Android has a hamburger drawer, iOS has bottom tabs
  // - The iOS nav bar is scrollable, Android is not
  // - Pull-to-refresh works differently, and Android has a button to trigger it too
  //
  // And these are all design time choices that doesn't have a single 'right'
  // answer.
  // ===========================================================================
  Widget _buildAndroid(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4, // 设置容器高度为屏幕高度的一半
                  color: Colors.teal, // 设置背景颜色为绿色
                  child: Stack(
                    children: [
                      Positioned(
                        top: screenSize.height * 0.06,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                          'assets/ic_avatar_placeholder.png',
                          width: 100,
                          height: 100,
                            //onPressed() 这里要设置一个案件返回widget的函数
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.19,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              'chen',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                            ),
                          ),
                      ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.23,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Musing since May 2023',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.28,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),//圆圈
                      Positioned(//右边的线
                        top: screenSize.height * 0.34,
                          left: screenSize.width * 0.19,
                            child: Container(
                              width: screenSize.width * 0.21,
                              child: Divider(
                              // height: 1,
                              color: Colors.white,
                              thickness: 2,

                            ),
                          ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.34,
                        right: screenSize.width * 0.19,
                        child: Container(
                          width: screenSize.width * 0.21,
                          child: Divider(
                            // height: 1,
                            color: Colors.white,
                            thickness: 2,

                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.3,
                        left: screenSize.width * 0.33,
                        right: 0,
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        ),//0 这应该是一个可以变的量
                      Positioned(
                        top: screenSize.height * 0.3,
                        left: screenSize.width * 0.62,
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),//0 这应该是一个可以变的量
                      Positioned(
                        top: screenSize.height * 0.35,
                        left: screenSize.width * 0.24,
                        child: Text(
                          'current',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),//current
                      Positioned(
                        top: screenSize.height * 0.35,
                        right: screenSize.width * 0.24,
                        child: Text(
                          'longest',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),//longest
                      Positioned(
                        top: screenSize.height * 0.33,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Streak',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )

                      ),//streak
                      Positioned(
                          top: screenSize.height * 0.3,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.local_fire_department,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                            ),//fire
                      ],
                          )
                    ),
                Container(
                  height: 25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(1000, 100),
                  ),
                  border: Border.all(
                  color: Colors.teal,
                  width: 4,
                  ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                containerStates[0] = true;
                                containerStates[1] = false;
                                containerStates[2] = false;// 切换容器状态
                              });
                            },
                            child: Image.asset(
                              'assets/ic_meditation_mode_all_no_shadow.png',
                              width: 30,
                              height: 30,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                containerStates[0] = false;
                                containerStates[1] = true;
                                containerStates[2] = false; // 切换容器状态
                              });
                            },
                            child: Image.asset(
                            'assets/ic_meditation_mode_mind_no_shadow.png',
                            width: 30,
                            height: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                containerStates[0] = false;
                                containerStates[1] = false;
                                containerStates[2] = true; // 切换容器状态
                              });
                            },
                            child: Image.asset(
                            'assets/ic_meditation_mode_timed_active.png',
                            width: 30,
                            height: 30,
                            ),
                          ),

                        ],
                      ),
                      ),
                    ),
                  ),
                ),//三个图标
                if (containerStates[0])
                  Container(
                    height: 250,
                    // color: Colors.green,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          'All',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        Row(
                           children:[
                             Expanded(
                             child: Divider(
                             thickness: 1,
                             color: Colors.grey,
                           ),
                             ),
                             Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8.0),
                               child: Column(
                               children:[
                                 Container(
                                   padding: EdgeInsets.all(0),
                                  child:Text(
                                 '20',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                   color: Colors.grey,
                                 ),
                               ),
                                 ),
                                 Container(
                                 padding: EdgeInsets.all(0),
                                  child:Text(
                                   'mins',
                                   style: TextStyle(
                                     fontSize: 15.0,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.grey,
                                   ),
                                 ),
                                 ),
    ],
                               ),
                             ),
    ],

                         ),
                        Flexible(
                          flex: 14,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '7',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 6,
                          child: Row(
                            children: [
                              Expanded(child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 24.0)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child:
                              Container(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Scrollbar(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 30.0),
                                    height: 20,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List<Widget>.generate(22, (index) {
                                          final number = index + 10;
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            alignment: Alignment.center,
                                            child: Text(
                                              number.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),




                        ),



                    ],
                        ),

                  ),
                if (containerStates[1])
                  Container(
                    height: 280,
                    // color: Colors.green,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          'Mind',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.indigoAccent,
                                ),
                              ),
                            Padding(padding: EdgeInsets.only(left: 6.0)),
                            Text(
                              'Calm time',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 50.0)),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.indigoAccent,
                                  width: 1,
                              ),
                            ),
    ),
                            Padding(padding: EdgeInsets.only(left: 6.0)),
                            Text(
                              'Session time',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '20',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 14,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '7',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 6,
                          child: Row(
                            children: [
                              Expanded(child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 24.0)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child:
                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Scrollbar(
                              child: Container(
                                padding: EdgeInsets.only(right: 30.0),
                                height: 20,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List<Widget>.generate(22, (index) {
                                      final number = index + 10;
                                      return Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          number.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),




                        ),



                      ],
                    ),
                  ),                // 根据状态显示容器
                if (containerStates[2])
                  Container(
                    height: 250,
                    // color: Colors.green,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          'Timer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '20',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 14,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '7',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children:[
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                        Flexible(
                          flex: 6,
                          child: Row(
                            children: [
                              Expanded(child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 24.0)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child:
                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Scrollbar(
                              child: Container(
                                padding: EdgeInsets.only(right: 30.0),
                                height: 20,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List<Widget>.generate(22, (index) {
                                      final number = index + 10;
                                      return Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          number.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),




                        ),



                      ],
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Session history',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                            color: Colors.grey,
                            Icons.arrow_forward_ios
                        ),
                      ],
                    ),
                  ),
                ),//session history
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                    child: Text(
                      "All Meditations",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),//all meditations
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 处理点击事件
                              print('Expanded widget clicked!');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ic_total_minutes.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'total minutes',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.grey,
                          width: 15.0,
                          indent: 5.0,
                          endIndent: 5.0,
                          thickness: 1.5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 处理点击事件
                              print('Expanded widget clicked!');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ic_muse_points.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'muse points',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children:[
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 15.0,
                        endIndent: 15.0,
                        thickness: 1.5,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 15.0,
                        endIndent: 15.0,
                        thickness: 1.5,
                      ),
                    ),

          ],
                ),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 处理点击事件
                              print('Expanded widget clicked!');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ic_birds.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'birds',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          width: 15.0,
                          indent: 5.0,
                          endIndent: 5.0,
                          thickness: 1.5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 处理点击事件
                              print('Expanded widget clicked!');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ic_recoveries_large.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'recoveries',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "This Week's Goal",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child:Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent, // 设置背景颜色为透明
                            border: Border.all(
                              color: Colors.grey, // 白色边框颜色
                              width: 2, // 边框宽度
                            ),
                            //borderRadius: BorderRadius.circular(1),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/ic_goals_teal.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                            '0 min / 10 min',

                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                          '(ends Sunday at midnight)',

                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        ],
                        ),

                      ),
                      Icon(
                          color: Colors.grey,
                          Icons.arrow_forward_ios
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Level 1 Challenge",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                      child:Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                          border: Border.all(
                            color: Colors.grey, // 白色边框颜色
                            width: 2, // 边框宽度
                          ),
                          //borderRadius: BorderRadius.circular(1),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/ic_challenges.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                      ),
                      Expanded(
                        flex: 8,
                      child:Text(
                        'Do 4 sessions in 1 week.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      ),
                      Icon(
                          color: Colors.grey,
                          Icons.arrow_forward_ios
                      ),
                  ],
                  ),
                ),


          ],
                    ),
    ),
      ),

            );
  // 下半部分的内容




    // appBar: AppBar(
      //   title: const Text(MeTab.title),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.refresh),
      //       onPressed: () async =>
      //       await _androidRefreshKey.currentState!.show(),
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.shuffle),
      //       onPressed: _togglePlatform,
      //     ),
      //   ],
      // ),
      // drawer: widget.androidDrawer,
  }

  Widget _buildIos(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _togglePlatform,
            child: const Icon(CupertinoIcons.shuffle),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: _refreshData,
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                _listBuilder,
                childCount: _itemsLength,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}





