import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:surveyapp/appWidgets/app_buttons.dart';

import 'base/app_colors.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final appColors = AppColors();
  String? pickedDate;
  final _formKey = GlobalKey<FormState>();
  final _phoneNumber = TextEditingController();
  String seletedcast = 'None';
  String seletedStatus = 'None';
  String seleteddesignation = 'None';
  List<String> castes = [
    'None',
    "Rajput",
    'Sharma',
    'Jaat',
    'Sain',
  ];
  List<String> status = ['None', 'Status1', 'Status2', 'Status3'];
  List<String> designation = [
    'None',
    'Doctor',
    'Engineer',
    'Party Worker',
    'Social Worker'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          _buildphonenumber(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _buildDropDown(castes, seletedcast, 'Select Cast'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _buildDropDown(status, seletedStatus, 'Party Status'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _buildDropDown(designation, seleteddesignation, 'Select Designation'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _buildDatepicker("Select Birth Date"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _buildDatepicker("Select anniversry Date"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Appbuttons().buildButton(appColors.themeColor, "Update".toUpperCase(), context, 0.9)
        ],
      ),
    );
  }

  Widget _buildphonenumber() {
    return Form(
        key: _formKey,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            color: appColors.whiteColor,
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneNumber,
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Field can't be empty";
                  }
                },
                cursorColor: appColors.blackColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "+910000000000",
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 13),
                    child: Text(
                      'Mobile No:',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: appColors.blackColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  Widget _buildDropDown(List<String> list, String dropDownValue, String title) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: appColors.lighblackColor),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              color: appColors.whiteColor,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropDownValue,
                  iconSize: 24,
                  style: TextStyle(color: appColors.blackColor),
                  onChanged: (String? newValue) {
                    setState(() {
                      if (title == "Select Cast") {
                        seletedcast = newValue!;
                        print(seletedcast);
                      } else if (title == "Party Status") {
                        seletedStatus = newValue!;
                        print(seletedStatus);
                      } else if (title == "Select Designation") {
                        seleteddesignation = newValue!;
                        print(seleteddesignation);
                      }
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildDatepicker(String palceholder) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      color: appColors.whiteColor,
      child: ListTile(
        leading: Text(
          pickedDate == null ? palceholder : pickedDate!,
          style: TextStyle(
              color: appColors.lightGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        trailing: InkWell(
          onTap: () {
            setState(() {
              datePicker();
            });
          },
          child: Icon(
            Icons.calendar_today,
            color: appColors.lighblackColor,
          ),
        ),
      ),
    );
  }

  datePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1970, 1, 1),
        maxTime: DateTime.now(), onConfirm: (date) {
      pickedDate = DateFormat.yMMMd().format(date);
      setState(() {});
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
    print("picked $pickedDate");
    return pickedDate;
  }
}
