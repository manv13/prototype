import 'package:flutter/material.dart';
import 'package:surveyapp/base/app_colors.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  
  List questions =[
    {
      "ques" : "My favourite Politician?",
      "a":"Narendra Modi",
      "b":"Ashok Gahlot",
      "c":"Narpat",
      "d":""
    },
    {
      "ques" : "Problem in area?",
      "a":"Lighting",
      "b":"Water",
      "c":"Employment",
      "d":""
    },
    {
      "ques" : "Are you satisfied with the policies of the central government?",
      "a":"Yes",
      "b":"No",
      "c":"",
      "d":""
    },
    {
      "ques" : "Satisfied with the service of Nearest E-Mitra?",
      "a":"yes",
      "b":"no",
      "c":"",
      "d":""
    },
    {
      "ques" : "Are you satisfied with the government policies?",
      "a":"Yes",
      "b":"No",
      "c":"",
      "d":""
    }
  ];
  List choice =[];
  final appColors = AppColors();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
choice = List.generate(questions.length, (index) {
  return List.generate(4, (index) => false);
});
  }
  var h;
  var w;
  var _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return ListView.builder(
      controller: _controller,
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${questions[index]["ques"]}"),
          questions[index]["a"]== ""?  Container():    Row(
                children: [
                  Checkbox(
                      value: choice[index][0],
                      onChanged: (value) {
                        oneSelect(index);
                        choice[index][0] = value!;
                        setState(() {});
                      }),
                  RichText(text: TextSpan(
                    text: "a)",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "\t${questions[index]["a"]}"
                      )
                    ]
                  ))
                ],
              ),
          questions[index]["b"]== ""?  Container():     Row(
                children: [
                  Checkbox(
                      value: choice[index][1],
                      onChanged: (value) {
                        oneSelect(index);
                        choice[index][1] = value!;
                        setState(() {});
                      }),
                  RichText(text: TextSpan(
                    text: "b)",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "\t${questions[index]["b"]}"
                      )
                    ]
                  ))
                ],
              ),
             questions[index]["c"]== ""?  Container():  Row(
                children: [
                  Checkbox(
                      value: choice[index][2],
                      onChanged: (value) {
                        oneSelect(index);
                        choice[index][2] = value!;
                        setState(() {});
                      }),
                  RichText(text: TextSpan(
                    text: "c)",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "\t${questions[index]["c"]}"
                      )
                    ]
                  ))
                ],
              ),
            questions[index]["d"]== ""?  Container(): Row(
                children: [
                  Checkbox(
                      value: choice[index][3],
                      onChanged: (value) {
                        oneSelect(index);
                        choice[index][3] = value!;
                        setState(() {});
                      }),
                  RichText(text: TextSpan(
                    text: "d)",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "\t${questions[index]["d"]}"
                      )
                    ]
                  ))
                ],
              ),
              Divider(
                color: appColors.themeColor,
              )
            ],

          ),
        );
      },
    );
  }
  oneSelect(int index){
    choice[index]= List.generate(4, (index) => false);
  }
}
