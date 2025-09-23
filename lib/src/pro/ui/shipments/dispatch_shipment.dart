import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class DispatchShipmentScreen extends StatefulWidget {
  const DispatchShipmentScreen({super.key});

  @override
  State<DispatchShipmentScreen> createState() => _DispatchShipmentScreenState();
}

class _DispatchShipmentScreenState extends State<DispatchShipmentScreen> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispatch Shipment'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
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
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            title: const Text(
              "Dashboard",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            children: [
              ListTile(
                leading: const Icon(
                  Icons.pending_actions_outlined,
                  color: Colors.amber,
                ),
                title: const Text('Staged'),
                trailing: SizedBox(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('3'),
                      onPressed: () {}),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.car_repair_sharp,
                  color: Colors.greenAccent,
                ),
                title: const Text('Shipped'),
                trailing: SizedBox(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('1'),
                      onPressed: () {}),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: const Text('Cancelled'),
                trailing: SizedBox(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('1'),
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
                    onTap: () async {},
                    child: Container(
                      child: ListTile(
                        title: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "124132",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "John Brown",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Text(
                              "345486",
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "1201-10-2023",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "9438759842",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Text(
                              "Staged",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.amber.shade800,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
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
