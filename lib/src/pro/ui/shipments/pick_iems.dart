import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:j3enterprise/src/pro/ui/shipments/pick_validation.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class PickItemScreen extends StatefulWidget {
  const PickItemScreen();

  @override
  State<PickItemScreen> createState() => _PickItemScreenState();
}

class _PickItemScreenState extends State<PickItemScreen> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Items'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 35,
                  child: ListFilter(
                    placeholder: 'Search',
                    onFilterChanged: (search) {
                      setState(() {
                        searchText = search;
                      });
                    },
                    filter: '',
                    function: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {},
                  child: Container(
                    child: ListTile(
                      tileColor: index == 1
                          ? Colors.green.shade100
                          : index == 2
                              ? Colors.red.shade100
                              : Colors.white,
                      minLeadingWidth: 20,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      leading: Icon(Icons.image, size: 30),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("124132", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                          Text("500", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child:
                                Text("Os Cranberry Juice C/Tail 15Oz 24", overflow: TextOverflow.fade, style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          Text("Picked", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey.shade400,
                );
              },
              itemCount: 3),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.shade400,
        ),
      ]),
      bottomNavigationBar: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Picked/Unpicked", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                    Text("200/665", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipment No: 32146534", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                        Text("Shipment Date: Oct 1, 2023", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PickValidationScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Complete Pick', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
