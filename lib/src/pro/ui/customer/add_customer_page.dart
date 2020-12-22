import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_nullable.dart';

class AddCustomerPage extends StatefulWidget {
  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)
                .translate('add_customer_appbar_title') ??
            "New Customer"),
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
                      labelText: AppLocalization.of(context)
                              .translate('contacts_label_add_customer') ??
                          'Add Contact',
                      suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(Icons.add_circle_outline_rounded))),
                  validationText: 'Test',
                )),
            getSectionTitle('Address'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('billing_address_add_customer') ??
                              'Billing Address',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.add_circle_outline_rounded))),
                      validationText: 'Test',
                    ),
                    TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('shipping_address_add_customer') ??
                              'Shipping Address',
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.add_circle_outline_rounded))),
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
                      suffixIcon: InkWell(
                          onTap: () {}, child: Icon(Icons.arrow_drop_down))),
                  validationText: 'Test',
                )),
          ],
        ),
      ),
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
