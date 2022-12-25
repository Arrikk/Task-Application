import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String, dynamic> desc;
  const TaskTimeLine(this.desc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          _buildTimeLine(desc['tlColor']),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(desc['time'].toString()),
                desc['title'].isNotEmpty
                    ? _buildTaskCard(
                        desc['bgColor'], desc['title'], desc['slot'])
                    : _buildTaskCard(Colors.white, '', '')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLine(Color color) {
    return SizedBox(
      height: 90,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 5),
            ),
          ),
        )
      ),
    );
  }

  Widget _buildTaskCard(Color? bgColor, String title, String slot) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            slot,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
