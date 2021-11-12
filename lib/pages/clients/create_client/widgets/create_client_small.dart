import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../clients.dart';

class CreateClientSmallScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var dateFormat;
  final timeFormat = DateFormat("hh:mm a");
  DateTime startDate;
  PhoneNumber number = PhoneNumber(isoCode: 'CM');
  String telephone = "";

  String dropDownValue;
  String languageValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "create_customer".tr,
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF283252),
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Expanded(
              // flex: 17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    height: 500,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_first_name".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: firstNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  labelStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  hintText: "Enter first name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_last_name".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: lastNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  labelStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  hintText: "Enter last name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'email'.tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "Enter customer email",
                                  //labelText: "email".tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'customer_phoneNumber'.tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 400,
                              ),
                              child: InternationalPhoneNumberInput(
                                selectorConfig: SelectorConfig(
                                  trailingSpace: false,
                                  setSelectorButtonAsPrefixIcon: false,
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                  showFlags: true,
                                ),
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber.length);
                                  // if (number.phoneNumber.length >= 13) {
                                  //   countryController
                                  //       .fetchACountry(number.isoCode);
                                  //   customerController
                                  //           .addressCountryNameController
                                  //           .value
                                  //           .text =
                                  //       countryController
                                  //           .selectedCountry.value.name;
                                  //   customerController.number.value =
                                  //       number.phoneNumber;
                                  // }
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                // textFieldController:
                                //     customerController.phoneNumber.value,
                                inputBorder: InputBorder.none,
                                inputDecoration: InputDecoration(
                                  hintText: "Enter Customer Phone Number",
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],
                                      width: 0.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF039BE5),
                                      width: 0.0,
                                    ),
                                  ),
                                  focusColor: Color(0xFF039BE5),
                                ),
                                formatInput: false,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                onSaved: (PhoneNumber number) {
                                  // customerController
                                  //         .addressCountryNameController
                                  //         .value
                                  //         .text =
                                  //     countryController
                                  //         .selectedCountry.value.name;
                                  // customerController.number.value =
                                  //     number.phoneNumber;
                                  // countryController
                                  //     .fetchACountry(number.isoCode);
                                  telephone = number.phoneNumber;
                                  print(number.phoneNumber);
                                  print(number.isoCode);
                                  print('On Saved: $number');
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'customer_gender'.tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                  ),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  labelStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                child: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'gender_hint'.tr,
                                      ),
                                      icon: Icon(null),
                                      value: dropDownValue,
                                      items: <String>['Male', 'Female', 'Other']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        print("value: " + value);
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() => dropDownValue = value);
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'lang'.tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                  ),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  labelStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                child: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'lang_hint'.tr,
                                      ),
                                      icon: Icon(null),
                                      value: languageValue,
                                      items: <String>[
                                        'English',
                                        'French',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        print("value: " + value);
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() => languageValue = value);
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'customer_dob'.tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 400,
                                maxHeight: 50.0,
                              ),
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return DateTimeField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 0.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF039BE5),
                                              width: 0.0)),
                                      focusColor: Color(0xFF039BE5),
                                      hintText:
                                          'Click to select Date of birth'.tr,
                                    ),
                                    dateFormat: dateFormat,
                                    mode: DateTimeFieldPickerMode.date,
                                    selectedDate: startDate,
                                    // ??
                                    //     DateTime.utc(1989, 11, 9),
                                    firstDate: DateTime.utc(1930, 11, 9),
                                    //lastDate: DateTime.utc(2010, 01, 01),
                                    onDateSelected: (DateTime value) {
                                      setState(() {
                                        startDate = value;
                                      });
                                    });
                              }),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_country".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                readOnly: true,
                                // controller: customerController
                                //     .addressCountryNameController.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "Enter customer's country",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_city".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: addressRegionController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "Enter customer's city",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_neighborhood".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: addressLocalityController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "Enter customer's neighborhood",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_street".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: TextFormField(
                                //controller: streetAddressController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF039BE5),
                                          width: 0.0)),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "Enter customer's street",
                                  // labelText: "customer_street".tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "customer_notes".tr,
                              color: Color(0xFF283252),
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 400,
                              ),
                              child: TextFormField(
                                maxLines: 6,
                                minLines: 3,
                                // controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[300], width: 0.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF039BE5), width: 0.0),
                                  ),
                                  focusColor: Color(0xFF039BE5),
                                  hintText: "customer_notes".tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.0),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              primary: Color(0xFF039BE5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5.0),
                              child: CustomText(
                                text: "create_customer".tr,
                              ),
                            ),
                            onPressed: () {
                              // this.createCustomer(
                              //     firstNameController.text,
                              //     emailController.text,
                              //     phoneNumberController.text,
                              //     customerController
                              //         .addressCountryNameController.value.text);
                              //
                              // Get.snackbar(
                              //   "Creating Customer",
                              //   "Customer is being created in the background. Thanks",
                              //   duration: Duration(seconds: 3),
                              // );
                              Get.to(
                                () => ClientsPage(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
