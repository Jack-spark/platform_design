// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings_tab.dart';
import 'widgets.dart';

class SettingTab extends StatelessWidget {
  const SettingTab();
  static const title = 'Setting';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.gear);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: SafeArea(
      bottom: true,
      child:SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ACCOUNT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
          decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // 设置边框样式
          borderRadius: BorderRadius.zero, // 设置边框圆角
          ),
           child:ListTile(
            trailing: Icon(Icons.arrow_forward),
            title: Text('Name'),
            onTap: () {
              // 处理抽屉 1 的点击事件
            },
           ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
           child: ListTile(
            trailing: Icon(Icons.arrow_forward),
            title: Text('Change Email or Password'),
            onTap: () {
              // 处理抽屉 2 的点击事件
            },
          ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
           child:ListTile(
            trailing: Icon(Icons.arrow_forward),
            title: Text('Account Information'),
            onTap: () {
              // 处理抽屉 3 的点击事件
            },
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'PRIVACY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Privacy Settings'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Data Policy'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'ABOUT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Third Party Software'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'NOTIFICATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Practice Reminders'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Email preferences'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'SYSTEM SETTINGS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Check For Firmware Update'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Firmware Version'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Muse Serial Number'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('App Version'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Region'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Sync Large Files on Wifi only'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'HELP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Frequently Asked Questions'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Online Help(web)'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Contact Customer Care'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'SEND FEEDBACK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Love Muse?Rate us!'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('Send Feedback'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'DEVELOPER TOOLS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // 设置边框样式
              borderRadius: BorderRadius.zero, // 设置边框圆角
            ),
            child:ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text('OSC Output'),
              onTap: () {
                // 处理抽屉 1 的点击事件
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // 处理按钮点击事件
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                  ),
                ),
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      ),
    ),
    );
  }
  }
  // ===========================================================================
  // Non-shared code below because on iOS, the settings tab is nested inside of
  // the Setting tab as a button in the nav bar.
  // ===========================================================================



