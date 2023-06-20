// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
          Lowercase('Name'),
          Lowercase('Change Email or Password'),
          Lowercase('Account Information'),
          Uppercase('PRIVACY'),
          Lowercase('Privacy Settings'),
          Lowercase('Data Policy'),
          Uppercase('ABOUT'),
          Lowercase('Third Party Software'),
          Uppercase('NOTIFICATION'),
          Lowercase('Practice Reminders'),
          Lowercase('Email preferences'),
          Uppercase('SYSTEM SETTINGS'),
          Lowercase('Check For Firmware Update'),
          Lowercase('Firmware Version'),
          Lowercase('Muse Serial Number'),
          Lowercase('App Version'),
          Lowercase('Region'),
          Lowercase('Sync Large Files on WiFi only'),
          Uppercase('HELP'),
          Lowercase('Frequently Asked Questions'),
          Lowercase('Online Help(web)'),
          Lowercase('Contact Customer Care'),
          Uppercase('SEND FEEDBACK'),
          Lowercase('Love Muse?Rate us!'),
          Lowercase('Send Feedback'),
          Uppercase('DEVELOPER TOOLS'),
          Lowercase('OSC Output'),
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

  Widget Lowercase(String title) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // 设置边框样式
        borderRadius: BorderRadius.zero, // 设置边框圆角
      ),
      child: ListTile(
        trailing: Icon(Icons.arrow_forward),
        title: Text(title),
        onTap: () {
          // 处理抽屉 2 的点击事件
        },
      ),
    );
  }
  Widget Uppercase(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
  // ===========================================================================
  // Non-shared code below because on iOS, the settings tab is nested inside of
  // the Setting tab as a button in the nav bar.
  // ===========================================================================