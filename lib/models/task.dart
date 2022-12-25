import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';

class Task {
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? bgColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;

  Task({
    this.icon,
    this.title,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.done,
    this.left,
    this.desc,
    this.isLast = false,
  });

  static List<Task> generateTask() {
    return [
      Task(
        icon: Icons.person_rounded,
        title: "Personal",
        iconColor: kYellowDark,
        bgColor: kYellowLight,
        btnColor: kYellow,
        left: 3,
        done: 1,
        desc: [
          {
            'time': '9:00 am',
            'title': 'Go for a walk with dog',
            'slot': '9:00 - 10:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight,  
          },
          {
            'time': '10:00 am',
            'title': 'Shot on Dribble',
            'slot': '10:00 - 12:00 am',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,  
          },
          {
            'time': '11:00 am',
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,  
          },
          {
            'time': '12:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kBlue,  
          },
          {
            'time': '1:00 pm',
            'title': '',
            'slot': '',
            'tlColor': Colors.grey.withOpacity(0.2),  
          },
          {
            'time': '2:00 pm',
            'title': 'Call with client',
            'slot': '2:00 - 3:00 pm',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight,  
          },
          {
            'time': '3:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kBlue,  
          },
        ]
      ),
      Task(
        icon: Icons.cases_rounded,
        title: "Work",
        iconColor: kRedDark,
        bgColor: kRedLight,
        btnColor: kRed,
        left: 5,
        done: 3,
      ),
      Task(
        icon: Icons.favorite_rounded,
        title: "Health",
        iconColor: kBlueDark,
        bgColor: kBlueLight,
        btnColor: kBlue,
        left: 0,
        done: 1,
      ),
      Task(isLast: true),
    ];
  }
}
