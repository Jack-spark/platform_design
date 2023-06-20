// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE fil

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'anniu.dart';
import 'programs_tab.dart';
import 'ti.dart';



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;  // 根据需要定义是否需要重绘
  }

class ButtonDetailPage extends StatelessWidget {
  final String buttonText;

  ButtonDetailPage({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buttonText),  // 使用按钮名称作为标题
      ),
      body: Container(
        // 页面内容的 Widget
        // ...
      ),
    );
  }
}


class MedidateTab extends StatefulWidget {
  static const title = 'Medidate';
  static final androidIcon = Icon(Icons.music_note);
  static final iosIcon = Image.asset(
    'assets/ic_bottombar_meditate.png',
  );

  const MedidateTab({super.key});

  @override
  State<MedidateTab> createState() => _MedidateTabState();
}

class _MedidateTabState extends State<MedidateTab> {
  final List<String> buttonLabels = ['Whats new                 4 sessions', 'June Staff Picks         6 sessions'];
  final List<String> buttonLabels2 = ['Muse 2 Stater Guide', 'Muse S Stater Guide', 'Foundations of Muse Mind Meditation',
    'Discover Heart,Breath&Body','14 Days of Sleep','Explore Guided Meditations','Muse Essentials'];
  final List<String> buttonLabels3 = ['Mind', 'Body', 'Heart', 'Breath','Timed',];
  List<String> buttonImagePaths = [
    'assets/ic_meditation_mode_mind_no_shadow.png',
    'assets/ic_meditation_mode_body_no_shadow.png',
    'assets/ic_meditation_mode_heart_no_shadow.png',
    'assets/ic_meditation_mode_breath_no_shadow.png',
    'assets/ic_meditation_mode_timed_no_shadow.png',
    // 添加更多按钮的图标数据
  ];
  List<String> buttonImagePaths2 = [
    'assets/a7.png',
    'assets/a5.png',
    // 添加更多按钮的图标数据
  ];
  List<String> buttonImagePaths3 = [
    'assets/a1.png',
    'assets/a4.png',
    'assets/a3.png',
    'assets/a2.png',
    'assets/a7.png',
    'assets/a5.png',
    'assets/a6.png',
    // 添加更多按钮的图标数据
  ];
  List<Widget> ButtonDetailPagea = [
  ButtonDetailPage1(),
  ButtonDetailPage2(),
  ];//feauture部件的界面

  List<Widget> ButtonDetailPageb = [
    ButtonDetailPage3(),
    ButtonDetailPage4(),
    ButtonDetailPage5(),
    ButtonDetailPage6(),
    ButtonDetailPage7(),
    ButtonDetailPage8(),
    ButtonDetailPage9(),
  ];//programs部件的界面

  List<Widget> ButtonDetailPagec = [
    SpeedyAnimation(),
    ButtonDetailPage4(),
    ButtonDetailPage4(),
    ButtonDetailPage4(),
    ButtonDetailPage10(),
  ];//meditation部件的界面

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child:SingleChildScrollView(
         child:Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/background_presleep_star_sky.png').image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(1000, 100),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'muse',
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: InkWell(
                    onTap: () {
                      // 处理按钮点击事件
                      print('Button clicked!');
                      // 添加您想要执行的操作
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent, // 设置背景颜色为透明
                      border: Border.all(
                        color: Colors.white, // 白色边框颜色
                        width: 2, // 边框宽度
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_goals_teal.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),//整个muse背景和部件的设定
            Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Featured',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),//Featured字体设定
            ButtonDetail(buttonLabels, buttonImagePaths2, ButtonDetailPagea),
            Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              child: Row(
                children: [
                  Text(
                    'Programs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ProgramsTab(),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ButtonDetailPage(buttonText: 'My Library'),
                      //   ),
                      // );
                    },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),//Programs字体设定
            ButtonDetail(buttonLabels2, buttonImagePaths3, ButtonDetailPageb),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Biofeedback Meditations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),//Biofeedback Meditations字体设定
            Container(
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buttonLabels3.length,
                itemBuilder: (context, index) {
                  final buttonText = buttonLabels3[index];
                  final buttonImagePath = buttonImagePaths[index]; // 新增的图片路径列表

                  return InkWell(
                    onTap: () {
                      // 导航到新的页面
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonDetailPagec[index],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            buttonImagePath, // 使用对应按钮的图片路径
                            width: 32,
                            height: 32,
                          ),
                          SizedBox(height: 8),
                          Text(
                            buttonLabels3[index],
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, top: 16),
              child: Text(
              'More Experiences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
           ),
            SizedBox(height: 16),
          InkWell(
            onTap: () {
              // 处理按钮的点击事件
              print('Button clicked!');
              // 添加您想要执行的操作
              // 导航到新的页面
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonDetailPage(buttonText: 'My Library'),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),  // 设置按钮与屏幕左右边缘的间距
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/a6.png').image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      '  Guided Meditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
            SizedBox(height: 16),  // 设置按钮之间的垂直间隔
          InkWell(
            onTap: () {
              // 处理按钮的点击事件
              print('Button clicked!');
              // 添加您想要执行的操作
              // 导航到新的页面
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonDetailPage(buttonText: 'My Library'),
                ),
              );
            },
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/background_presleep_star_sky.png').image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Programs',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
            SizedBox(height: 16),  // 设置按钮之间的垂直间隔
            InkWell(
              onTap: () {
                // 处理按钮的点击事件
                print('Button clicked!');
                // 添加您想要执行的操作
                // 导航到新的页面
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonDetailPage(buttonText: 'My Library'),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/a4.png').image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'My Library',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
        ],
      ),
      ),
      ),
    );
  }

  Widget ButtonDetail(List<String> buttonLabels, List<String> buttonImagePaths, List<Widget> ButtonDetailPage) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonLabels.length,
        itemBuilder: (context, index) {
          final buttonText = buttonLabels[index];
          final buttonImagePath = buttonImagePaths[index];
          return InkWell(
            onTap: () {
              // 导航到新的页面
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonDetailPage[index],
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(buttonImagePath,).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft, // 仅对图标进行水平居中对齐
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child:Icon(
                            Icons.density_medium,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Wrap(
                            children: [
                              Text(
                                buttonText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

