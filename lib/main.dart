// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'medidate_tab.dart';
import 'setting_tab.dart';
import 'me_tab.dart';
import 'widgets.dart';

void main() => runApp(const MyAdaptingApp());

class MyAdaptingApp extends StatelessWidget {
  const MyAdaptingApp({super.key});

  @override
  Widget build(context) {
    // Either Material or Cupertino widgets work in either Material or Cupertino
    // Apps.
    return MaterialApp(
      title: 'Adaptive Music App',
      theme: ThemeData(
        // Use the green theme for Material widgets.
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          // Instead of letting Cupertino widgets auto-adapt to the Material
          // theme (which is green), this app will use a different theme
          // for Cupertino (which is blue by default).
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const PlatformAdaptingHomePage(),
    );
  }
}

// Shows a different type of scaffold depending on the platform.
//
// This file has the most amount of non-sharable code since it behaves the most
// differently between the platforms.
//
// These differences are also subjective and have more than one 'right' answer
// depending on the app and content.
class PlatformAdaptingHomePage extends StatefulWidget {
  const PlatformAdaptingHomePage({super.key});

  @override
  State<PlatformAdaptingHomePage> createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {
  // This app keeps a global key for the Me tab because it owns a bunch of
  // data. Since changing platform re-parents those tabs into different
  // scaffolds, keeping a global key to it lets this app keep that tab's data as
  // the platform toggles.
  //
  // This isn't needed for apps that doesn't toggle platforms while running.
  final MeTabKey = GlobalKey();

  // In Material, this app uses the hamburger menu paradigm and flatly lists
  // all 4 possible tabs. This drawer is injected into the Me tab which is
  // actually building the scaffold around the drawer.
  Widget _buildAndroidHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items:  [
          BottomNavigationBarItem(
            label: MeTab.title,
            icon: MeTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: MedidateTab.title,
            icon: MedidateTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: SettingTab.title,
            icon: SettingTab.iosIcon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
            defaultTitle: MeTab.title,
            builder: (context) => MeTab(key: MeTabKey),
          ),
          1 => CupertinoTabView(
            defaultTitle: MedidateTab.title,
            builder: (context) => const MedidateTab(),
          ),
          2 => CupertinoTabView(
            defaultTitle: SettingTab.title,
            builder: (context) => const SettingTab(),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  // On iOS, the app uses a bottom tab paradigm. Here, each tab view sits inside
  // a tab in the tab scaffold. The tab scaffold also positions the tab bar
  // in a row at the bottom.
  //
  // An important thing to note is that while a Material Drawer can display a
  // large number of items, a tab bar cannot. To illustrate one way of adjusting
  // for this, the app folds its fourth tab (the settings page) into the
  // third tab. This is a common pattern on iOS.
  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items:  [
          BottomNavigationBarItem(
            label: MeTab.title,
            icon: MeTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: MedidateTab.title,
            icon: MedidateTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: SettingTab.title,
            icon: SettingTab.iosIcon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
              defaultTitle: MeTab.title,
              builder: (context) => MeTab(key: MeTabKey),
            ),
          1 => CupertinoTabView(
              defaultTitle: MedidateTab.title,
              builder: (context) => const MedidateTab(),
            ),
          2 => CupertinoTabView(
              defaultTitle: SettingTab.title,
              builder: (context) => const SettingTab(),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

