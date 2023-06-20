import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:platform_design/me_tab.dart';
import 'medidate_tab.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'programs_tab.dart';
import 'utils.dart';
import 'widgets.dart';

class ButtonDetailPage1 extends StatefulWidget {
  @override
  _ButtonDetailPage1State createState() => _ButtonDetailPage1State();
}

class _ButtonDetailPage1State extends State<ButtonDetailPage1> {
  bool isIconChanged = false;
  bool isClickable = true;

  void _handleIconTap(BuildContext context) {
    if (!isClickable) return;

    setState(() {
      isIconChanged = !isIconChanged;
      isClickable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 设置透明背景
        elevation: 0, // 移除阴影效果
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3, // 上半部分高度
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/a7.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: isIconChanged
                              ? Image.asset(
                            'assets/complete_checkmark.png', // 替换为另一个图标
                            width: 30,
                            height: 30,
                          )
                              : Image.asset(
                            'assets/jiantou.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Immediate Sensor Check',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'The sensor check now starts right after your Muse is connected to Bluetooth.',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 80, // 距离顶部的距离，此处假设前一个按钮的高度为60
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                // 处理第二个按钮的点击事件
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                          //borderRadius: BorderRadius.circular(1),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Extra Meditation Time',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'You can now include or exclude additional meditation time to your results.',

                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 160,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Bluetooth Troubleshooting',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Troubleshoot bluetooth disconnection during your session.',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 240,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'My Library',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Access your recent content from MyLibrary.',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16, // 按钮距离顶部的距离
            right: 16, // 按钮距离右侧的距离
            child: Container(
              width: 48, // 按钮的宽度
              height: 48, // 按钮的高度
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
                border: Border.all(
                  color: Colors.white, // 边框颜色
                  width: 2, // 边框宽度
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  // 处理按钮点击事件
                  _showPopup(context);
                },
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight), // 包含状态栏和AppBar高度的外边距
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Whats New',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8), // 添加一个间距
                    Text(
                      'Find out whats new in Msue APP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8), // 添加一个间距
                    ElevatedButton(
                      onPressed: () {
                        // Handle button click event
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        width: 220, // Adjust the width as desired
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/ic_goals_teal.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Join the Discussion',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.green,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 8,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 8,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 8,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 8,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '2/4',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height / 2, // 弹出页面的高度，此处为屏幕高度的一半
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  'Add Muse Device', // 添加您的文本内容
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Turn on your muse', // 添加更多文本内容
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please enable Bluetooth in your \nphone settings and make sure \nyour Muse Device is on and \ncharged.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // 设置文本居中对齐
                  overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                ),
                SizedBox(height: 8), // 添加一个间距
                Container(
                  width: 200, // 设置按钮宽度
                  height: 60, // 设置按钮高度
                  child: ElevatedButton(
                    onPressed: () {
                      // 处理按钮点击事件
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.cyan,
                    ),
                    child: Text(
                      'Next', // 添加更多文本内容
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonDetailPage2 extends StatelessWidget {
  void _handleIconTap(BuildContext context) {
    // 处理图标点击事件的逻辑
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 设置透明背景
        elevation: 0, // 移除阴影效果
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3, // 上半部分高度
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/a5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Breath·Visualization',

                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            'A Mountain Walk',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                      Text(
                        '13m 29s',
                        style: TextStyle(
                          fontSize: 10.0,
                          ),
                         ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/ashlye_placeholder.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 80, // 距离顶部的距离，此处假设前一个按钮的高度为60
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                // 处理第二个按钮的点击事件
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                          //borderRadius: BorderRadius.circular(1),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Inspiration·Visualition',

                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            'Imagine Your Day',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '9m 44s',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/ashlye_placeholder.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16, // 按钮距离顶部的距离
            right: 16, // 按钮距离右侧的距离
            child: Container(
              width: 48, // 按钮的宽度
              height: 48, // 按钮的高度
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
                border: Border.all(
                  color: Colors.white, // 边框颜色
                  width: 2, // 边框宽度
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  // 处理按钮点击事件
                  _showPopup(context);
                },
              ),
            ),
          ),

          Container(
            //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight), // 包含状态栏和AppBar高度的外边距
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'June Stuff Picks',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8), // 添加一个间距
                    Text(
                      'Expenrience Muses Content Oops Specialist Larissa \nVelosos favorite guided practices.This collection\n is updated monthly, with handpicked meditation\n practiced by Muse staff.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left, // 设置文本居中对齐
                      overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height / 2, // 弹出页面的高度，此处为屏幕高度的一半
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  'Add Muse Device', // 添加您的文本内容
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Turn on your muse', // 添加更多文本内容
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please enable Bluetooth in your \nphone settings and make sure \nyour Muse Device is on and \ncharged.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // 设置文本居中对齐
                  overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                ),
                SizedBox(height: 8), // 添加一个间距
                Container(
                  width: 200, // 设置按钮宽度
                  height: 60, // 设置按钮高度
                  child: ElevatedButton(
                    onPressed: () {
                      // 处理按钮点击事件
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.cyan,
                    ),
                    child: Text(
                      'Next', // 添加更多文本内容
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonDetailPage3 extends StatefulWidget {
  @override
  _ButtonDetailPage3State createState() => _ButtonDetailPage3State();
}

class _ButtonDetailPage3State extends State<ButtonDetailPage3> {
  bool isIconChanged = false;
  bool isClickable = true;
  bool isIconChanged2 = false;
  bool isClickable2 = true;

  void _handleIconTap(BuildContext context) {
    if (!isClickable) return;

    setState(() {
      isIconChanged = !isIconChanged;
      isClickable = false;
    });
  }

  void _handleIconTap2(BuildContext context) {
    if (!isClickable2) return;

    setState(() {
      isIconChanged2 = !isIconChanged2;
      isClickable2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 设置透明背景
        elevation: 0, // 移除阴影效果
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3, // 上半部分高度
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/a1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: isIconChanged
                              ? Image.asset(
                            'assets/complete_checkmark.png', // 替换为另一个图标
                            width: 30,
                            height: 30,
                          )
                              : Image.asset(
                            'assets/ic_guided_meditation_record_play.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Welcome',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Welcome to your Muse journey',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 80, // 距离顶部的距离，此处假设前一个按钮的高度为60
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap2(context);
                // 处理第二个按钮的点击事件
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                          //borderRadius: BorderRadius.circular(1),
                        ),
                        child: Center(
                          child: isIconChanged2
                              ? Image.asset(
                            'assets/complete_checkmark.png', // 替换为另一个图标
                            width: 30,
                            height: 30,
                          )
                              : Image.asset(
                            'assets/ic_guided_meditation_record_play.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Connecting Your Muse',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'How to turn on and sync your device',

                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 160,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Fitting your Muse',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'How to fit your device and troubleshooting',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 16 + 240,
            left: 0,
            right: 16,
            child: InkWell(
              onTap: () {
                _handleIconTap(context);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // 设置背景颜色为透明
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/complete_checkmark.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'My Library',

                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Access your recent content from MyLibrary.',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16, // 按钮距离顶部的距离
            right: 16, // 按钮距离右侧的距离
            child: Container(
              width: 48, // 按钮的宽度
              height: 48, // 按钮的高度
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
                border: Border.all(
                  color: Colors.white, // 边框颜色
                  width: 2, // 边框宽度
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  // 处理按钮点击事件
                  _showPopup(context);
                },
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight), // 包含状态栏和AppBar高度的外边距
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muse 2 Starter Guide',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8), // 添加一个间距
                    Text(
                      'Get the most from your Muse headband. \nFind out how each type of meditation differs, how to interpret post session reports, and more.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                    ),
                    SizedBox(height: 8), // 添加一个间距
                    ElevatedButton(
                      onPressed: () {
                        // Handle button click event
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        width: 220, // Adjust the width as desired
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/ic_goals_teal.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Join the Discussion',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.green,
                              size: 16,
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
        ],
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height / 2, // 弹出页面的高度，此处为屏幕高度的一半
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  'Add Muse Device', // 添加您的文本内容
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Turn on your muse', // 添加更多文本内容
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please enable Bluetooth in your \nphone settings and make sure \nyour Muse Device is on and \ncharged.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // 设置文本居中对齐
                  overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                ),
                SizedBox(height: 8), // 添加一个间距
                Container(
                  width: 200, // 设置按钮宽度
                  height: 60, // 设置按钮高度
                  child: ElevatedButton(
                    onPressed: () {
                      // 处理按钮点击事件
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.cyan,
                    ),
                    child: Text(
                      'Next', // 添加更多文本内容
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonDetailPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        // 页面 1 的内容
        // ...
      ),
    );
  }
}

class ButtonDetailPage10 extends StatelessWidget {
  void _handleIconTap(BuildContext context) {
    // 处理图标点击事件的逻辑
  }
  final List<String> buttonLabels2 = ['Stream', 'Beach', 'Forest'];
  List<String> buttonImagePaths3 = [
    'assets/b3.png',
    'assets/b2.png',
    'assets/b1.png',
    // 添加更多按钮的图标数据
  ];
  List<Widget> ButtonDetailPageb = [
    Rainforest(),
    Rainforest(),
    Rainforest(),
  ];
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
                      color: Color.fromRGBO(255, 208, 225, 1),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.9, -0.8),
                          child: InkWell(
                            onTap: () {
                              // 处理按钮点击事件
                              print('Button click!');
                              // 添加您想要执行的操作
                            },
                            child: Container(
                              width: 48, // 按钮的宽度
                              height: 48, // 按钮的高度
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.cyan,
                                border: Border.all(
                                  color: Colors.white, // 边框颜色
                                  width: 2, // 边框宽度
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.white,
                                onPressed: () {
                                  // 处理按钮点击事件
                                  _showPopup(context);
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.9, -1),
                          child: Transform.scale(
                            scale: 1.5, // 调整缩放比例
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MedidateTab(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.1,
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: 0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Timed',
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
                              'Find calm without your headband and listen to a '
                                  'soundscape without real-time biofeedback.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                    alignment: Alignment.bottomLeft, // 仅对图标进行水平居中对齐
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
            ],
          ),
        ),
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height / 2, // 弹出页面的高度，此处为屏幕高度的一半
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  'Add Muse Device', // 添加您的文本内容
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Turn on your muse', // 添加更多文本内容
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please enable Bluetooth in your \nphone settings and make sure \nyour Muse Device is on and \ncharged.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // 设置文本居中对齐
                  overflow: TextOverflow.visible, // 允许文本超出边界显示多行
                ),
                SizedBox(height: 8), // 添加一个间距
                Container(
                  width: 200, // 设置按钮宽度
                  height: 60, // 设置按钮高度
                  child: ElevatedButton(
                    onPressed: () {
                      // 处理按钮点击事件
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.cyan,
                    ),
                    child: Text(
                      'Next', // 添加更多文本内容
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonDetailPage11 extends StatefulWidget {
  final Duration duration1;
  ButtonDetailPage11({required this.duration1});
  // print(duration1);
  @override
  _ButtonDetailPage11State createState() => _ButtonDetailPage11State();
}

class _ButtonDetailPage11State extends State<ButtonDetailPage11> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();
  DateTime currentTime = DateTime.now();
  Timer? timer;
  bool isPlaying = true;
  bool isPaused = true;
  bool isLooping = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  Duration yiDuration = Duration(seconds:1);
  double get remainingProgress => (totalDuration - currentPosition - yiDuration).inMilliseconds / (totalDuration + yiDuration).inMilliseconds;
  bool showRemainingTime = false;

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      player.pause();
    } else {
      player.setSource(AssetSource('gentle_river_L0.mp3')).then((value) {
        player.play(
          AssetSource('gentle_river_L0.mp3'),
        );
      });
    }

    if (isLooping) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.release);
    }


  }

  @override
  void initState() {
    super.initState();
    _togglePause();
    player.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = widget.duration1;
      });
    });

    player.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
    // 每分钟更新一次时间
    timer = Timer.periodic(Duration(seconds: 60), (Timer t) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = (totalDuration - currentPosition).toString().split('.').first;
    String totalTime = totalDuration.toString().split('.').first;
    if (remainingTime.startsWith('-')) {
      remainingTime = '00:00';
      player.stop();
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPage1(currentPosition: currentPosition),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 390,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 4.8, // 设置放大倍数，这里为2.0
                  child: CircularProgressIndicator(
                    value: remainingProgress,
                    strokeWidth: 5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      DateFormat.Hm().format(currentTime), // Format to display only hours and minutes
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // 添加一个间距
                    Text(
                      'Stream',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30), // 添加一个间距
                    InkWell(
                      onTap: () {
                        // 处理按钮点击事件
                        print('Button click!');
                      },
                      child: Container(
                        width: 300, // 调整宽度为更大的值
                        height: 100, // 调整高度为更大的值
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5), // 设置半透明的背景颜色
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5), // 调整圆角半径为一半的宽度
                        ),
                        child: Center(
                          child: Text(
                            isPaused
                                ? 'session paused'
                                : 'progressed',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showRemainingTime = true;
                  });
                  _togglePause();
                },
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: isPaused
                      ? Image.asset('assets/ic_guided_meditation_record_play.png')
                      : Image.asset('assets/zanting.png')
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 300,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isLooping = !isLooping;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: isLooping ? Colors.green : Colors.grey,
                  child: Icon(
                    Icons.loop,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 0,
              right: 300,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YinliangPage(player: player),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.book,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 585,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Time remaining · $remainingTime',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 635,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    player.stop();
                    // 处理按钮点击事件
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage1(currentPosition: currentPosition),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'End Session',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}

class ButtonDetailPage12 extends StatefulWidget {
  final Duration duration1;
  ButtonDetailPage12({required this.duration1});

  @override
  _ButtonDetailPage12State createState() => _ButtonDetailPage12State();
}

class _ButtonDetailPage12State extends State<ButtonDetailPage12> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();
  DateTime currentTime = DateTime.now();
  Timer? timer;
  bool isPlaying = true;
  bool isPaused = true;
  bool isLooping = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  Duration yiDuration = Duration(seconds:1);
  double get remainingProgress => (totalDuration - currentPosition).inMilliseconds / (totalDuration + yiDuration).inMilliseconds;

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      player.pause();
    } else {
      player.setSource(AssetSource('beach_environment.mp3')).then((value) {
        player.play(
          AssetSource('beach_environment.mp3'),
        );
      });
    }

    if (isLooping) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.release);
    }

  }

  @override
  void initState() {
    super.initState();
    _togglePause();
    player.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = widget.duration1;
      });
    });

    player.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
    // 每分钟更新一次时间
    timer = Timer.periodic(Duration(seconds: 60), (Timer t) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = (totalDuration - currentPosition).toString().split('.').first;
    if (remainingTime.startsWith('-')) {
      remainingTime = '00:00';
      player.stop();
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPage2(currentPosition: currentPosition),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 390,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 4.8, // 设置放大倍数，这里为2.0
                  child: CircularProgressIndicator(
                    value: remainingProgress,
                    strokeWidth: 5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      DateFormat.Hm().format(currentTime), // Format to display only hours and minutes
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // 添加一个间距
                    Text(
                      'Beach',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10), // 添加一个间距
                    InkWell(
                      onTap: () {
                        // 处理按钮点击事件
                        print('Button click!');
                      },
                      child: Container(
                        width: 300, // 调整宽度为更大的值
                        height: 100, // 调整高度为更大的值
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5), // 设置半透明的背景颜色
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5), // 调整圆角半径为一半的宽度
                        ),
                        child: Center(
                          child: Text(
                            isPaused
                                ? 'session paused'
                                : 'progressed',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  _togglePause();
                },
                child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: isPaused
                        ? Image.asset('assets/ic_guided_meditation_record_play.png')
                        : Image.asset('assets/zanting.png')
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 300,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isLooping = !isLooping;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: isLooping ? Colors.green : Colors.grey,
                  child: Icon(
                    Icons.loop,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 0,
              right: 300,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YinliangPage(player: player),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.book,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 585,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Time remaining · $remainingTime',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 635,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    player.stop();
                    // 处理按钮点击事件
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage2(currentPosition: currentPosition),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'End Session',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}

class ButtonDetailPage13 extends StatefulWidget {
  final Duration duration1;
  ButtonDetailPage13({required this.duration1});

  @override
  _ButtonDetailPage13State createState() => _ButtonDetailPage13State();
}

class _ButtonDetailPage13State extends State<ButtonDetailPage13> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();
  DateTime currentTime = DateTime.now();
  Timer? timer;
  bool isPlaying = true;
  bool isPaused = true;
  bool isLooping = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  Duration yiDuration = Duration(seconds:1);
  double get remainingProgress => (totalDuration - currentPosition).inMilliseconds / (totalDuration + yiDuration).inMilliseconds;

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      player.pause();
    } else {
      player.setSource(AssetSource('forest.mp3')).then((value) {
        player.play(
          AssetSource('forest.mp3'),
        );
      });
    }

    if (isLooping) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.release);
    }

  }

  @override
  void initState() {
    super.initState();
    _togglePause();
    player.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = widget.duration1;
      });
    });

    player.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
    // 每分钟更新一次时间
    timer = Timer.periodic(Duration(seconds: 60), (Timer t) {
      setState(()  {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = (totalDuration - currentPosition).toString().split('.').first;
    if (remainingTime.startsWith('-')) {
      remainingTime = '00:00';
      player.stop();
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPage3(currentPosition: currentPosition),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 390,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 4.8, // 设置放大倍数，这里为2.0
                  child: CircularProgressIndicator(
                    value: remainingProgress,
                    strokeWidth: 5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      DateFormat.Hm().format(currentTime), // Format to display only hours and minutes
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // 添加一个间距
                    Text(
                      'Forest',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10), // 添加一个间距
                    InkWell(
                      onTap: () {
                        // 处理按钮点击事件
                        print('Button click!');
                      },
                      child: Container(
                        width: 300, // 调整宽度为更大的值
                        height: 100, // 调整高度为更大的值
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5), // 设置半透明的背景颜色
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5), // 调整圆角半径为一半的宽度
                        ),
                        child: Center(
                          child: Text(
                            isPaused
                                ? 'session paused'
                                : 'progressed',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  _togglePause();
                },
                child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: isPaused
                        ? Image.asset('assets/ic_guided_meditation_record_play.png')
                        : Image.asset('assets/zanting.png')
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 300,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isLooping = !isLooping;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: isLooping ? Colors.green : Colors.grey,
                  child: Icon(
                    Icons.loop,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 0,
              right: 300,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YinliangPage(player: player),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.book,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 585,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                'Time remaining · $remainingTime',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 635,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    player.stop();
                    // 处理按钮点击事件
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage3(currentPosition: currentPosition),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'End Session',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}

class YinliangPage extends StatefulWidget {
  final AudioPlayer player;

  YinliangPage({required this.player});

  @override
  _YinliangPageState createState() => _YinliangPageState();
}

class _YinliangPageState extends State<YinliangPage> {
  double volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: volume,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  volume = value;
                  widget.player.setVolume(volume);
                });
              },
            ),
            Text('Volume: ${volume.toStringAsFixed(2)}'),
            ControlsTab(player: widget.player), // 添加音频控制部分
          ],
        ),
      ),
    );
  }
}

class ControlsTab extends StatelessWidget {
  final AudioPlayer player;

  const ControlsTab({required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Text('Volume'),
        ),
        Column(
          children: [0.0, 0.5, 1.0].map((it) {
            final formattedVal = it.toStringAsFixed(1);
            return ElevatedButton(
              key: Key('control-volume-$formattedVal'),
              child: Text(formattedVal),
              onPressed: () => player.setVolume(it),
            );
          }).toList(),
        ),
      ],

    );
  }
}

class NewPage1 extends StatelessWidget {
  final Duration currentPosition;

  NewPage1({required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat.Hm().format(currentTime);
    String formattedPosition =
    DateFormat.Hms().format(DateTime(0).add(currentPosition));
    String timeDiff = DateFormat.Hm().format(currentTime.subtract(currentPosition));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/c1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(1000, 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/ic_meditation_mode_timed_no_shadow.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Timed Session',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_app_launcher.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Journey',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Forest',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Unguided',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_goals_teal.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeDiff,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Start Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_recoveries_large.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedTime',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'End Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_total_minutes.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedPosition',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Session Duration',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Stats',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/ic_muse_points.png',
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'muse points',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Journal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  '  No journal entires',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child:InkWell(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonDetailPage10(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    '  Delete session',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Rest of the code...
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage2 extends StatelessWidget {
  final Duration currentPosition;

  NewPage2({required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat.Hm().format(currentTime);
    String formattedPosition =
    DateFormat.Hms().format(DateTime(0).add(currentPosition));
    String timeDiff = DateFormat.Hm().format(currentTime.subtract(currentPosition));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/c1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(1000, 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/ic_meditation_mode_timed_no_shadow.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Timed Session',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_app_launcher.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Journey',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Forest',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Unguided',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_goals_teal.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeDiff,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Start Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_recoveries_large.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedTime',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'End Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_total_minutes.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedPosition',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Session Duration',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Stats',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/ic_muse_points.png',
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'muse points',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Journal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  '  No journal entires',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child:InkWell(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonDetailPage10(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    '  Delete session',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Rest of the code...
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage3 extends StatelessWidget {
  final Duration currentPosition;

  NewPage3({required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat.Hm().format(currentTime);
    String formattedPosition =
    DateFormat.Hms().format(DateTime(0).add(currentPosition));
    String timeDiff = DateFormat.Hm().format(currentTime.subtract(currentPosition));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/c1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(1000, 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/ic_meditation_mode_timed_no_shadow.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Timed Session',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_app_launcher.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Journey',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Forest',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Unguided',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_goals_teal.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeDiff,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Start Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_recoveries_large.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedTime',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'End Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_total_minutes.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$formattedPosition',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Session Duration',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Stats',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/ic_muse_points.png',
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'muse points',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Journal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  '  No journal entires',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child:InkWell(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonDetailPage10(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    '  Delete session',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Rest of the code...
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/c1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(1000, 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonDetailPage10(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/ic_meditation_mode_timed_no_shadow.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Timed Session',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_app_launcher.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Journey',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Forest',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Unguided',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_goals_teal.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'timeDiff',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Start Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_recoveries_large.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'End Time',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade100,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/ic_total_minutes.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Session Duration',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Stats',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/ic_muse_points.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              SizedBox(height: 10),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'muse points',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Journal',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  '  No journal entires',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child:InkWell(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonDetailPage10(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    '  Delete session',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Rest of the code...
            ],
          ),
        ),
      ),
    );
  }
}
