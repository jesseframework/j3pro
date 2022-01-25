import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/items/add_item_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class ItemsPage extends StatelessWidget {
  static final route = '/itempage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context)!.translate('items_appbar_title') ??
                "Items"),
        actions: [
          InkWell(
            onTap: () {
              //Navigator.push(context, EnterExitRoute(enterPage: AddItemPage(), exitPage: ));
            },
            child: Row(
              children: [
                Text(
                  "New",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(),
                Icon(Icons.add_circle_outline)
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Center(
                  child: ListFilter(
                      function: (value) {},
                      placeholder: 'Search',
                      filter: '',
                      onFilterChanged: (search) {}),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                      'COVID-19 N95 MASKS',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('SKU: 0001-202'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
              ),
            )
          ]),
    );
  }
}
