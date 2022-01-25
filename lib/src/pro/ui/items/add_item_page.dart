import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_nullable.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context)!.translate('add_item_appbar_title') ??
                "New Item"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.save)
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: ExpansionTile(
                title: Text(
                  'Item Photo',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                children: [
                  Column(
                    children: [
                      Icon(Icons.image, size: 200),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Attach Photo',
                              style: TextStyle(
                                  color: Theme.of(context).textSelectionColor),
                            ),
                            Icon(Icons.attach_file,
                                color: Theme.of(context).textSelectionColor)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            getSectionTitle('Item'),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                      labelText: AppLocalization.of(context)!
                              .translate('item_code_label_add_item') ??
                          'Item Code',
                    ),
                    validationText: 'Test',
                  ),
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                      labelText: AppLocalization.of(context)!
                              .translate('item_name_label_add_item') ??
                          'Item Name *',
                    ),
                    validationText: 'Test',
                  ),
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                      labelText: AppLocalization.of(context)!
                              .translate('description_label_add_item') ??
                          'Description',
                    ),
                    validationText: 'Test',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFromFieldReusable(
                          fieldDecoration: InputDecoration(
                              labelText: AppLocalization.of(context)!
                                      .translate('upc_code_label_add_item') ??
                                  'UPC Code *',
                              suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.arrow_drop_down))),
                          validationText: 'Test',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('UPC code', style: headerstyle()),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text('UPC code', style: headerstyle()),
                        ),
                        Container()
                      ],
                    ),
                    children: [
                      Container(
                        height: 120,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              color: (index % 2 == 0)
                                  ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2)
                                  : Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.1),
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('123456789'),
                                    Text('Code39'),
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)!
                                .translate('product_group_label_add_item') ??
                            'Product Group *',
                        suffixIcon: InkWell(
                            onTap: () {}, child: Icon(Icons.arrow_drop_down))),
                    validationText: 'Test',
                  ),
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)!
                                .translate('unit_of_measure_label_add_item') ??
                            'Unit of Measure *',
                        suffixIcon: InkWell(
                            onTap: () {}, child: Icon(Icons.arrow_drop_down))),
                    validationText: 'Test',
                  ),
                  TextFromFieldReusable(
                    fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)!
                                .translate('category_label_add_item') ??
                            'Category *',
                        suffixIcon: InkWell(
                            onTap: () {}, child: Icon(Icons.arrow_drop_down))),
                    validationText: 'Test',
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: ExpansionTile(
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Type',
                        style: headerstyle(),
                      ),
                      Text(
                        'Currency',
                        style: headerstyle(),
                      ),
                      Text(
                        'Exchange Rate',
                        style: headerstyle(),
                      ),
                      Text(
                        'Payment Amount',
                        style: headerstyle(),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
    );
  }

  TextStyle headerstyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Theme.of(context).primaryColor,
    );
  }
}
