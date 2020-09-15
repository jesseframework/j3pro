import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_nullable.dart';

class EditCustomerPade extends StatefulWidget {
  @override
  _EditCustomerPadeState createState() => _EditCustomerPadeState();
}

class _EditCustomerPadeState extends State<EditCustomerPade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)
                .translate('edit_customer_appbar_title') ??
            "Edit Customer"),
        actions: [
          InkWell(
             onTap: (){
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
            getSectionTitle('Customer'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context).translate(
                                'customer_number_label_add_customer') ??
                            'Customer Number',
                      ),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context).translate(
                                'customer_name_label_add_customer') ??
                            'Customer Name *',
                      ),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context).translate(
                                  'customer_type_label_add_customer') ??
                              'Customer Type *',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context).translate(
                                  'customer_group_label_add_customer') ??
                              'Customer Group *',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                  ],
                )),
            getSectionTitle('Company'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)
                                .translate('company_name_label_add_customer') ??
                            'Company Name',
                      ),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('territory_label_add_customer') ??
                              'Territory',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                  ],
                )),
            getSectionTitle('Price Setup'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('currency_label_add_customer') ??
                              'Currency',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('price_list_add_customer') ??
                              'Price List',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('tax group_add_customer') ??
                              'Tax Group',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down))),
                      validationText: 'Test',
                    ),
                  ],
                )),
            getSectionTitle('Contacts'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFromFieldNullableReusable(
                  fieldDecoration: InputDecoration(
                      hintText: "Grey",
                      suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(Icons.edit))),
                  validationText: 'Test',
                )),
            getSectionTitle('Address'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildSalesOrderCardTile(
                        heading: 'Billing Address',
                        title:
                            'Head Office, St. Catherine 100 Parkway Boulevard Portmore St. Catherine 00000 Jamaica',
                        trailingWidget: Icon(Icons.edit),
                        callback: () {}),
                    SizedBox(
                      height: 15,
                    ),
                    buildSalesOrderCardTile(
                        heading: 'Shipping Address',
                        title: 'Head Office, St. Catherine 100 Parkway Boulevard Portmore St. Catherine 00000 Jamaica',
                        trailingWidget: Icon(Icons.edit),
                        callback: () {}),
                    ],
                  ),
                )),
            getSectionTitle('Contacts'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFromFieldNullableReusable(
                  fieldDecoration: InputDecoration(
                      labelText: AppLocalization.of(context)
                              .translate('payment_terms_add_customer') ??
                          'Payment Terms',
                      suffixIcon: InkWell(
                          onTap: () {}, child: Icon(Icons.arrow_drop_down))),
                  validationText: 'Test',
                )),
                 getSectionTitle('Model of Payment'),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              height: MediaQuery.of(context).size.height * 0.38,
              child: Container(
                  child: Column(
                children: [
                  Padding(
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
                          'Default',
                          style: headerstyle(),
                        ),
                        Text(
                          'AML Limit',
                          style: headerstyle(),
                        ),
                        Container()
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Container(
                        color: (index % 2 == 0)
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Theme.of(context).cardColor.withOpacity(0.1),
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Credit Card'),
                              Text('JMD'),
                              Checkbox(value: true, onChanged: (value){}),
                              Text('\$9,000.00        '),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )),
            ),
               getSectionTitle('Additional Info'),
            Container(
              margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFromFieldNullableReusable(
                  
                  fieldDecoration: InputDecoration(
                  
                      labelText: AppLocalization.of(context)
                              .translate('additional_info_add_customer') ??
                          'Additional Info',
                      
                  )
                )),
          ],
        ),
      ),
    );
  }


 Widget buildSalesOrderCardTile(
      {String heading,
      String title,
      Widget trailingWidget,
      Function callback}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textSelectionColor,
              fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            InkWell(
                child: Container(
                    margin: EdgeInsets.only(left: 8), child: trailingWidget),
                onTap: callback),
          ],
        ),
      ],
    );
  }




  TextStyle headerstyle() {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: Theme.of(context).primaryColor);
  }

  Widget getSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
    );
  }
}


Widget getRichText(String text) {
  return RichText(
    text: TextSpan(text: text, children: [
      TextSpan(
        text: ' *',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    ]),
  );
}
