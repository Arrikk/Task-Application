import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/details/widgets/app_bar.dart';
import 'package:task_app/screens/details/widgets/date_picker.dart';
import 'package:task_app/screens/details/widgets/task_timeline.dart';

class DetailsPage extends StatelessWidget {
  final Task task;
  const DetailsPage(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          BuildAppBar(task),
          SliverToBoxAdapter(
            child: Container(
              // padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                children: [DatePicker()],
              ),
            ),
          ),
          task.desc == null
              ? SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                      "No Task Today",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => TaskTimeLine(task.desc![index]),
                    childCount: task.desc?.length
                  ),
                ),
        ],
      ),
    );
  }
}
