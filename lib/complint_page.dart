import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/appWidgets/app_buttons.dart';

import 'base/app_colors.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final appColors = AppColors();
  final _voterid = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _name = TextEditingController();
  final _remark = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? comlaintvalue = "No Name in voter List";
  List<String> comlaints = [
    'No Name in voter List',
    'Water Problem',
    'Road Problem',
    'Electricity  Problem',
    'Job problem',
    'Lack of Higher Education',
    'Late Payment of old age pansion',
    'Lack of public bus service',
    'Lack of payment of destroyed crop'
  ];

  _save() {
    if (_formKey.currentState!.validate()) {
      print("object");
    } else {
      print("kfvjkrgnj");
    }
  }

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget.tween(
      duration: const Duration(milliseconds: 200),
      enabled: true,
      translationDisabled: const Offset(200, 0),
      translationEnabled: const Offset(0, 0),
      child: OpacityAnimatedWidget.tween(
        enabled: true,
        opacityDisabled: 0,
        opacityEnabled: 1,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              _buildDropDown(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _buildOtherDetails(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                  onTap: _save,
                  child: Appbuttons()
                      .buildButton(appColors.blueColor, 'SAVE', context, 0.8)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Appbuttons().buildButton(
                  appColors.themeColor, 'VIEW  COMPLAINTS', context, 0.8)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropDown() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Complaint:',
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
                  value: comlaintvalue,
                  iconSize: 24,
                  style: TextStyle(color: appColors.blackColor),
                  onChanged: (String? newValue) {
                    setState(() {
                      comlaintvalue = newValue!;
                    });
                  },
                  items:
                      comlaints.map<DropdownMenuItem<String>>((String value) {
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

  Widget _buildOtherDetails() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            color: appColors.whiteColor,
            child: Center(
              child: TextFormField(
                controller: _voterid,
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Field can't be empty";
                  }
                },
                cursorColor: appColors.blackColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "SBL11759",
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 13),
                    child: Text(
                      'Voter ID:',
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            color: appColors.whiteColor,
            child: Center(
              child: TextFormField(
                controller: _name,
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Field can't be empty";
                  }
                },
                cursorColor: appColors.blackColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "KOJUSINGH",
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 13),
                    child: Text(
                      'Name:',
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Other Remark:',
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
                height: MediaQuery.of(context).size.height * 0.2,
                color: appColors.whiteColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _remark,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Field can't be empty";
                        }
                      },
                      cursorColor: appColors.blackColor,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Other remark...",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
