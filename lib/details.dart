import 'package:flutter/material.dart';

import 'appWidgets/app_buttons.dart';
import 'base/app_colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final appColors = AppColors();
  Map<String, String> detailsList = {
    'Voter Sr. No.': "1",
    "Voter ID": "SBL1197569",
    "Voter Name": "Koju Singh",
    "Gender": "Male",
    "Age": "34",
    "Friend Name": "Chatur Singh",
    "House No.": "34",
    "Colony": "Akhasar",
    "Vote Center Address": "address here"
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: detailsList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: _buildField(detailsList.keys.toList()[index],
                    detailsList.values.toList()[index]),
              );
            })),
        Appbuttons()
            .buildButton(appColors.themeColor, 'Send Voter Slip', context, 0.9)
      ],
    );
  }

  Widget _buildField(String key, String value) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      color: appColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$key : $value",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
