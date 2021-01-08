import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/checkbox.dart';
import 'package:j3enterprise/src/resources/shared/widgets/dropdown_box.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_notnullable.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_nullable.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  //Dropdown settings
  var addressTypeSelectedItem;
  var addressContactSelectedItem;
  var customerSelectedItem;
  var linkedCompanySelectedItem;
  var isCompanyAddressCheckBoxOption = false;
  var isPrimaryAddressCheckBoxOption = false;
  var isShippingAddressCheckBoxOption = false;

  //Form fields
  var _apiAddressLine1Controller = TextEditingController();
  // var _apiAddressLine2Controller = TextEditingController();
  var _apiCityController = TextEditingController();
  var _apiStateController = TextEditingController();
  var _apiPostalZipCodeController = TextEditingController();
  var _apiCountryController = TextEditingController();
  var _apiContactPersonController = TextEditingController();
  var _apiCustomerController = TextEditingController();
  var _apiPhoneNumberController = TextEditingController();
  var _apiLatitudeController = TextEditingController();
  var _apiLongitudeController = TextEditingController();

  _onUpdateAddressTypeSelection(String value) {
    setState(() {
      addressTypeSelectedItem = value;
    });
  }

  _onUpdateAddressContactSelection(String value) {
    setState(() {
      addressContactSelectedItem = value;
    });
  }

  _onUpdateCustomerSelection(String value) {
    setState(() {
      customerSelectedItem = value;
    });
  }

  _onUpdateLinkedCompanySelection(String value) {
    setState(() {
      linkedCompanySelectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('add_address_appbar_title') ??
                "New Address"),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0, 0),
              child: Row(children: [
                Text('Address',
                    style: TextStyle(color: Color.fromRGBO(72, 82, 85, 1)))
              ]),
            ),
            Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNotNullableReusable(
                        labelName: AppLocalization.of(context)
                                .translate('address_label_communication') ??
                            'Address Line 1',
                        controllerName: _apiAddressLine1Controller,
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNullableReusable(
                        fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context)
                                  .translate('address_label_communication') ??
                              'Address Line 2',
                        ),
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNotNullableReusable(
                        labelName: AppLocalization.of(context)
                                .translate('city_label_communication') ??
                            'City',
                        controllerName: _apiCityController,
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNotNullableReusable(
                        labelName: AppLocalization.of(context)
                                .translate('state_label_communication') ??
                            'State',
                        controllerName: _apiStateController,
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNotNullableReusable(
                        labelName: AppLocalization.of(context).translate(
                                'postalzipcode_label_communication') ??
                            'Postal/Zip Code',
                        controllerName: _apiPostalZipCodeController,
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: DropdownFormFieldNormalReuse(
                        _onUpdateAddressTypeSelection,
                        hintText: AppLocalization.of(context).translate(
                                'address_type_label_communication') ??
                            'Address Type',
                        selectedValue: addressTypeSelectedItem,
                        listData: ['Billing', 'Shipping'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: DropdownFormFieldNormalReuse(
                        _onUpdateAddressContactSelection,
                        hintText: AppLocalization.of(context).translate(
                                'address_contact_label_communication') ??
                            'Address Contact',
                        selectedValue: addressContactSelectedItem,
                        listData: ['Jane Doe', 'John Brown'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: TextFromFieldNullableReusable(
                        fieldDecoration: InputDecoration(
                          labelText: AppLocalization.of(context).translate(
                                  'phone_number_label_communication') ??
                              'Contact Number',
                        ),
                        validationText: 'Test',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.00),
                      child: DropdownFormFieldNormalReuse(
                        _onUpdateCustomerSelection,
                        hintText: AppLocalization.of(context).translate(
                                'address_customer_label_communication') ??
                            'Customer',
                        selectedValue: customerSelectedItem,
                        listData: ['Jane Doe', 'John Brown'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.00),
                      child: Expanded(
                        child: ClipRect(
                          child: Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                        value: isCompanyAddressCheckBoxOption,
                                        onChanged: (value) {
                                          setState(() {
                                            isCompanyAddressCheckBoxOption =
                                                value;
                                          });
                                        }),
                                    Text('Is Company Address',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                        value: isPrimaryAddressCheckBoxOption,
                                        onChanged: (value) {
                                          setState(() {
                                            isPrimaryAddressCheckBoxOption =
                                                value;
                                          });
                                        }),
                                    Text('Is Primary Address',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                        value: isShippingAddressCheckBoxOption,
                                        onChanged: (value) {
                                          setState(() {
                                            isShippingAddressCheckBoxOption =
                                                value;
                                          });
                                        }),
                                    Text('Is Shipping Address',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0, 0),
              child: Row(children: [
                Text('Location Coordinates',
                    style: TextStyle(color: Color.fromRGBO(72, 82, 85, 1)))
              ]),
            ),
            Container(
              //ToDo Create a business rule to enable/disable coordinates.
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.00),
                    child: TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)
                                .translate('latitude_label_communication') ??
                            'Latitude',
                      ),
                      validationText: 'Test',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.00),
                    child: TextFromFieldNullableReusable(
                      fieldDecoration: InputDecoration(
                        labelText: AppLocalization.of(context)
                                .translate('longitude_label_communication') ??
                            'Longitude',
                      ),
                      validationText: 'Test',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Text(
                        'Generate',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0, 0),
              child: Row(children: [
                Text('Link Company',
                    style: TextStyle(color: Color.fromRGBO(72, 82, 85, 1)))
              ]),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(0.00),
                child: DropdownFormFieldNormalReuse(
                  _onUpdateLinkedCompanySelection,
                  hintText: AppLocalization.of(context)
                          .translate('company_name_label_communication') ??
                      'Company Name',
                  selectedValue: linkedCompanySelectedItem,
                  listData: ['Computer Expertz Ltd', 'LCJ Technologies'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
