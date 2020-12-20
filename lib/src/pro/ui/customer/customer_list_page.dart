import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/bloc/sales_order_bloc.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

import 'add_customer_page.dart';
import 'edit_customer_page.dart';

class CustomerListPage extends StatefulWidget {
  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('customer_appbar_title') ??
                "Customers"),
        actions: [
          InkWell(
              onTap: (){
               Navigator.push(
                          context, EnterExitRoute(enterPage: AddCustomerPage()));
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    child: Center(
                      child: ListFilter(
                          placeholder: 'Search',

                          onFilterChanged: (search) {

                          }),
                    ),
                  ),
 ),
         
        Expanded(child:

        ListView.separated(
            itemCount: 100,
            itemBuilder: (context,index){
          return InkWell(
             onTap: (){
               
               Navigator.push(
                          context, EnterExitRoute(enterPage: EditCustomerPade()));
            },
            
                      child: ListTile(
              leading: Icon(Icons.image,size: 30,),
              title: Text('COMPUTER EXPERTZ LTD',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              subtitle: Text('120 Portmore Boulevard' ,) ,
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
            separatorBuilder:(context,index){
        return Divider(color: Colors.grey,);
        },
        )
        )
      ],
    ),
      
    );
  }
}
