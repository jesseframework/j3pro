import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/shipments/shipment_details.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class ShipmentScreen extends StatefulWidget {
  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipments'),
      ),
      body: Column(
        children: [
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
          ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            children: [
              ListTile(
                minVerticalPadding: 0,
                leading: Icon(
                  Icons.mail,
                  color: Colors.blue.shade400,
                ),
                title: Text('New'),
                trailing: Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text('1'),
                      onPressed: () {}),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.pending_actions_outlined,
                  color: Colors.amber,
                ),
                title: Text('Picked'),
                trailing: Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text('3'),
                      onPressed: () {}),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.done_all,
                  color: Colors.greenAccent,
                ),
                title: Text('Staged'),
                trailing: Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text('1'),
                      onPressed: () {}),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: Text('Cancelled'),
                trailing: Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text('1'),
                      onPressed: () {}),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShipmentDetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("124132", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(
                              "20000",
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("124132", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                Text(
                                  "Picked",
                                  style: TextStyle(color: Colors.amber.shade800, fontWeight: FontWeight.w700, fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              "Validating 1 of 3",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red.shade800),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      thickness: 1,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
                itemCount: 10),
          )
        ],
        // Your widget code here
      ),
    );
  }
}
