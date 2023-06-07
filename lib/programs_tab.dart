import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:platform_design/me_tab.dart';
import 'medidate_tab.dart';
import 'anniu.dart';

import 'utils.dart';
import 'widgets.dart';

class ProgramsTab extends StatefulWidget {
  const ProgramsTab({super.key});

  @override
  State<ProgramsTab> createState() => _ProgramsTabState();
}

class _ProgramsTabState extends State<ProgramsTab> {
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();
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
  ];

  List<Widget> ButtonDetailPageb = [
    ButtonDetailPage3(),
    ButtonDetailPage4(),
    ButtonDetailPage5(),
    ButtonDetailPage6(),
    ButtonDetailPage7(),
    ButtonDetailPage8(),
    ButtonDetailPage9(),
  ];

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {

  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
          () => setState(() => _setData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background_presleep_star_sky.png'), // 设置背景图像
                        fit: BoxFit.cover, // 图像适应方式
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.9, -1),
                          child: InkWell(
                            onTap: () {
                              // 处理按钮点击事件
                              print('Button click!');
                              // 添加您想要执行的操作
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
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
                        Align(
                          alignment: Alignment(-0.9, -1),
                          child:
                              IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.1,
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: 0,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                              'Programs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                              ),
                          ),
                        ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.16,
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sequential guidance and instruction to help you '
                              'create new habits, shift behaviors and reach your '
                              'goals',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: Image.asset('assets/background_presleep_star_sky.png').image,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     borderRadius: BorderRadius.vertical(
                  //       bottom: Radius.elliptical(1000, 100),
                  //     ),
                  // ),
                  ),
                ],
              ),
               Padding(padding: EdgeInsets.all(10)),
               // Scrollbar(
               Container(
                 height: MediaQuery.of(context).size.width*1.2  ,
                margin: EdgeInsets.symmetric(vertical: 16),
                child:
                Scrollbar(
                  child: ListView.builder(
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  scrollDirection: Axis.vertical,
                  itemCount: buttonLabels2.length,
                  itemBuilder: (context, index) {
                    final buttonText = buttonLabels2[index];
                    final buttonImagePath = buttonImagePaths3[index];

                    return InkWell(
                      onTap: () {
                        // 导航到新的页面
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonDetailPageb[index],
                          ),
                        );
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width ,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.asset(buttonImagePath).image,
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
                                    padding: EdgeInsets.only(top: 60),
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
               ),
               ),




               // RefreshIndicator(
               //    // key: _androidRefreshKey,
               //    onRefresh: _refreshData,
               //    child: ListView(
               //        children: items.map((item) => ListTile(
               //          title: Text(item),
               //        )).toList(),
               //    ),
               // ),
          ],
                  ),

                  ),





          ),
        );

  }
}