import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DatePicker extends StatefulWidget {
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final weekDate = [24, 25, 26, 27, 28, 29, 30];
    var selected = 3;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => setState(() => selected = index),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selected == index ? Colors.grey.shade200 : null,
            ),
            child: Column(
              children: [
                Text(
                  weekDays[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selected == index ? Colors.black : Colors.grey),
                ),
                Text(
                  weekDate[index].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selected == index ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (_, i) => const SizedBox(width: 5),
        itemCount: weekDate.length,
      ),
    );
  }
}
