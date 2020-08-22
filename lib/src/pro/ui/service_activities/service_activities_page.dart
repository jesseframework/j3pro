import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class ServiceActivitiesPage extends StatefulWidget {
  @override
  _ServiceActivitiesPageState createState() => _ServiceActivitiesPageState();
}

class _ServiceActivitiesPageState extends State<ServiceActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
           SliverAppBar(

            title:  Text( AppLocalization.of(context).translate('service_activities_appbar_title') ??
        "Service Activities"),

//ToDO put translation
             forceElevated: innerBoxIsScrolled,
            floating: true,
            pinned: true,
        ),

          SliverList(

              delegate: SliverChildListDelegate(
                  [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 5),
                  child: Center(
                    child: ListFilter(
                        placeholder: 'Search',

                        onFilterChanged: (search) {

                        }),
                  ),
                )
              ]),
            ),

        ];
      },
    body: Column(
      children: [

        ExpansionTile(

            title: Text("Dashboard",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
          children: [
               ListTile(
                 leading: Icon(Icons.file_upload,color: Colors.deepPurple ,),
                 title: Text('In Progress'),
                 trailing: Container(
                   height: 30,
                   width: 90,
                   child: RaisedButton(
                     shape:RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: Text('1'),
                     color: Colors.deepPurple ,
                       onPressed: (){}
                       ),
                 ),
               ),
            ListTile(
              leading: Icon(Icons.done_all,color: Colors.greenAccent,),
              title: Text('Complete'),
              trailing: Container(
                height: 30,
                width: 90,
                child: RaisedButton(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text('1'),
                    color: Colors.green ,
                    onPressed: (){}
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.warning_rounded,color: Colors.amber,),
              title: Text('In Progress'),
              trailing: Container(
                height: 30,
                width: 90,
                child: RaisedButton(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text('1'),
                    color: Colors.amber ,
                    onPressed: (){}
                ),
              ),
            )
          ],
        ),
        Expanded(child:

        ListView.separated(
            itemCount: 100,
            itemBuilder: (context,index){
          return ListTile(
            leading: Icon(Icons.image,size: 30,),
            title: Text('COMPUTER EXPERTZ LTD',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            subtitle: Text('120 Portmore Boulevard' ,) ,
          );
        },
            separatorBuilder:(context,index){
        return Divider(color: Colors.grey,);
        },
        )
        )
      ],
    )
      ));
  }
}
