import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:task_app/screens/details/details_page.dart';

// ignore: use_key_in_widget_constructors
class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Task.generateTask();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => tasks[index].isLast
            ? _buildAddTask()
            : _buildTaskCard(context, tasks[index]),
        itemCount: tasks.length,
      ),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(5),
      dashPattern: const [10, 10],
      child: const Center(
        child: Text(
          '+ Add Task',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, Task task) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailsPage(task))
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: task.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.icon,
              color: task.iconColor,
              size: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              task.title.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _buildStatusButton(task.btnColor, task.iconColor, '${task.left} left'),
                const SizedBox(width: 10,),
                _buildStatusButton(Colors.white, task.iconColor, '${task.done} done'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(Color? btnColor, Color? color, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: btnColor
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 15),),
    );
  }
}
