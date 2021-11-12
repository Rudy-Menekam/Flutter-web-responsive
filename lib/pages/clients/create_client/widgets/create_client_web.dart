import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateClientWidget extends StatelessWidget {
  //var uuid = Uuid();
  var dateFormat;
  final timeFormat = DateFormat("hh:mm a");
  DateTime startDate;
  PhoneNumber number = PhoneNumber(isoCode: 'CM');
  String telephone = "";

  String dropDownValue;
  String languageValue;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Container(
      height: Get.width / 2,
      width: Get.width / 2,
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10,
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
              //flex: 17,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        width: Get.width / 3,
                        height: Get.height / 1.2,
                        child: ListView(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 16.0),
                            //   child: Align(
                            //     alignment: Alignment.topLeft,
                            //     child: Text(
                            //       'personal_information'.tr,
                            //       style: TextStyle(
                            //         fontFamily: 'Montserrat',
                            //         fontSize: 22.0,
                            //         color: Color(0xFF283252),
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("customer_first_name".tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        //controller: firstNameController,
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
                                          labelStyle: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                          hintText: "Enter first name",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("customer_last_name".tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        //controller: lastNameController,
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
                                          labelStyle: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                          hintText: "Enter last name",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('email'.tr),
                                SizedBox(height: 10.0),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: Get.width / 3,
                                  ),
                                  child: TextFormField(
                                    //controller: emailController,
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
                                Text('customer_phoneNumber'.tr),
                                SizedBox(height: 10.0),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: Get.width / 3,
                                  ),
                                  child: InternationalPhoneNumberInput(
                                    selectorConfig: SelectorConfig(
                                      trailingSpace: false,
                                      setSelectorButtonAsPrefixIcon: false,
                                      selectorType:
                                          PhoneInputSelectorType.DIALOG,
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('customer_gender'.tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
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
                                                  color: Colors.grey[300],
                                                  width: 0.0)),
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
                                              items: <String>[
                                                'Male',
                                                'Female',
                                                'Other'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                print("value: " + value);
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() =>
                                                    dropDownValue = value);
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'lang'.tr,
                                    ),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
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
                                                  color: Colors.grey[300],
                                                  width: 0.0)),
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
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() =>
                                                    languageValue = value);
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('customer_dob'.tr),
                                SizedBox(height: 10.0),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: Get.width / 3,
                                    maxHeight: 50.0,
                                  ),
                                  child: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
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
                                              'Click to select Date of birth'
                                                  .tr,
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
                            // SizedBox(height: 16.0),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 16.0),
                            //   child: Align(
                            //     alignment: Alignment.bottomLeft,
                            //     child: Text(
                            //       'address'.tr,
                            //       style: TextStyle(
                            //         fontFamily: 'Montserrat',
                            //         fontSize: 22.0,
                            //         color: Color(0xFF283252),
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("customer_country".tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        readOnly: true,
                                        // controller: customerController
                                        //     .addressCountryNameController.value,
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
                                          hintText: "Enter customer's country",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("customer_city".tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        //controller: addressRegionController,
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
                                          hintText: "Enter customer's city",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("customer_neighborhood".tr),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        //controller: addressLocalityController,
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
                                              "Enter customer's neighborhood",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "customer_street".tr,
                                    ),
                                    SizedBox(height: 10.0),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: Get.width / 6.3,
                                      ),
                                      child: TextFormField(
                                        //controller: streetAddressController,
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
                                          hintText: "Enter customer's street",
                                          // labelText: "customer_street".tr,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(height: 35.0),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 16.0),
                            //   child: Align(
                            //     alignment: Alignment.bottomLeft,
                            //     child: Text(
                            //       'customer_notes'.tr,
                            //       style: TextStyle(
                            //         fontFamily: 'Montserrat',
                            //         fontSize: 22.0,
                            //         color: Color(0xFF283252),
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("customer_notes".tr),
                                SizedBox(height: 10.0),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: Get.width / 1.5,
                                  ),
                                  child: TextFormField(
                                    maxLines: 6,
                                    minLines: 3,
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 0.0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF039BE5),
                                            width: 0.0),
                                      ),
                                      focusColor: Color(0xFF039BE5),
                                      hintText: "customer_notes".tr,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(60.0, 10.0, 70.0, 10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 45, vertical: 25),
                                  primary: Color(0xFF167dff),
                                  fixedSize: Size(160, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "submit".tr,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  formKey.currentState.save();
                                  // var response = this.createCustomer(
                                  //     firstNameController.text,
                                  //     emailController.text,
                                  //     telephone,
                                  //     customerController
                                  //         .addressCountryNameController.value.text);

                                  Get.snackbar("Creating Customer",
                                      "Customer is being created in the background. Thanks",
                                      duration: Duration(seconds: 3));
                                  Get.to(() => ClientsPage());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
