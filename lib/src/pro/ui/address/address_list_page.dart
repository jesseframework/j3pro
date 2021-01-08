import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

import 'add_address_page.dart';

class AddressListPage extends StatefulWidget {
  @override
  static final route = '/address';
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('address_appbar_title') ??
                "Addresses"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, EnterExitRoute(enterPage: AddAddressPage()));
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
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Center(
                child: ListFilter(
                    placeholder: 'Search', onFilterChanged: (search) {}),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 100,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context, EnterExitRoute(enterPage: AddAddressPage()));
                },
                child: ListTile(
                  // leading: Icon(
                  //   Icons.image,
                  //   size: 30,
                  // ),
                  title: Text('120 PORTMORE BOULEVARD',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  subtitle: Text(
                    'Computer Expertz Limited - Billing',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
          ))
        ],
      ),
    );
  }
}
