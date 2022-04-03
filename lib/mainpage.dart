import 'package:flutter/material.dart';
import 'package:surveyapp/base/app_colors.dart';
import 'package:surveyapp/complint_page.dart';
import 'package:surveyapp/details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedindex = 0;
  final List<String> tabBarItems = ['Details', 'Update', 'Survey', 'Complaint'];
  final appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.scaffoldBgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appColors.themeColor,
          leading: Icon(
            Icons.arrow_back,
            color: appColors.whiteColor,
          ),
          title: Text("dynamic title",
              style: TextStyle(
                  color: appColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        body: selectedindex == 0 ? DetailsPage() : ComplaintPage());
  }

  Widget _builTabs() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabBarItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0.7, top: 0.7),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });
                        },
                        child: _buildCotainer(tabBarItems[index], index)),
                  );
                })));
  }

  Widget _buildCotainer(String title, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.05,
      color:
          selectedindex == index ? appColors.whiteColor : appColors.themeColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Text(title,
              style: TextStyle(
                  color: selectedindex == index
                      ? appColors.blackColor
                      : appColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}