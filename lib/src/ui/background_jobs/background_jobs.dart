import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/icons/custom_icons.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';

import 'background_fetch_page.dart';
import 'backgroundjobs_pages.dart';

class SetupBackgroundPage extends StatefulWidget {
  const SetupBackgroundPage({super.key});

  @override
  _SetupBackgroundPageState createState() => _SetupBackgroundPageState();
}

class _SetupBackgroundPageState extends State<SetupBackgroundPage> {
  bool _enabled = true;
  void _onClickEnable(enabled) {
    setState(() {
      _enabled = enabled;
    });
    if (enabled) {
      BackgroundFetch.start().then((int status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((int status) {
        print('[BackgroundFetch] stop success: $status');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: Platform.isAndroid || Platform.isIOS
              ? TabBar(
                  tabs: [
                    Tab(
                      icon: const Icon(CustomIcons.wrench_solid),
                      text: AppLocalization.of(context)!
                              .translate('tab_app_servies') ??
                          'App Servies',
                    ),
                    Tab(
                      icon: const Icon(CustomIcons.cog_regular),
                      text: AppLocalization.of(context)!
                              .translate('tab_device_servies') ??
                          'Device Serives',
                    )
                  ],
                )
              : null,
          title: Text(
              AppLocalization.of(context)!.translate('title_background_jobs') ??
                  'Background Jobs'),
          actions: <Widget>[
            Switch(
                activeThumbColor: Theme.of(context).scaffoldBackgroundColor,
                value: _enabled,
                onChanged: _onClickEnable),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Icon(Icons.cloud_download, size: 40, color: Colors.white),
                ],
              ),
            )
          ],
        ),
        body: Platform.isAndroid || Platform.isIOS
            ? const TabBarView(
                children: [
                  //Tab 1
                  BackgroundFetchPage(),
                  //Tab 2
                  BackgroundJobsPage()
                ],
              )
            : const BackgroundJobsPage(),
      ),
    );
  }
}
