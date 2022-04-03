import 'package:flutter/material.dart';

import 'base/app_colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(4, (index) {
          return _buildField();
        }),
      ),
    );
  }

  Widget _buildField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      color: appColors.whiteColor,
    );
  }
}
