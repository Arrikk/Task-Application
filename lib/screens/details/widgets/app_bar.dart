import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';

class BuildAppBar extends StatelessWidget {
  final Task task;
  const BuildAppBar(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 90,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          size: 35,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(task.title.toString(), style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 5),
            Text('You have ${task.left} tasks left for today', style: const TextStyle(color: Colors.grey, fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
