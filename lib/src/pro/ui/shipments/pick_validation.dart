import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/shipments/dispatch_shipment.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class PickValidationScreen extends StatefulWidget {
  const PickValidationScreen();

  @override
  State<PickValidationScreen> createState() => _PickValidationScreenState();
}

class _PickValidationScreenState extends State<PickValidationScreen> {
  List<bool> tiles = [false, false, false];
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Validation'),
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
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: tiles[index],
                        tileColor: tiles[index] ? Colors.green.shade100 : Colors.white,
                        onChanged: (value) => {
                          setState(() {
                            tiles[index] = value!;
                          })
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text("124132", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700))),
                            SizedBox(
                              width: 80,
                              height: 25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("500", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        hintText: '200',
                                        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                                      ),
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.grey.shade700,
                                      cursorHeight: 20,
                                      cursorWidth: 1,
                                      cursorRadius: Radius.circular(1),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        subtitle: Text("Os Cranberry Juice C/Tail 15Oz 24", style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ));
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
                    Text("Total Ordered/Validated", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                    Text("855/500", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
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
                              builder: (context) => DispatchShipmentScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Validate Pick', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
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
