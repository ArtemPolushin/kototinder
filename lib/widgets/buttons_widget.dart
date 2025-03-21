import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback onDisLike;
  final int counterDislikes;
  final int counterLikes;

  const ButtonsWidget({
    super.key,
    required this.onLike,
    required this.onDisLike,
    required this.counterDislikes,
    required this.counterLikes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: onDisLike,
              icon: Icon(Icons.thumb_down, color: Colors.red),
              iconSize: 40,
            ),
            Text("$counterDislikes"),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: onLike,
              icon: Icon(Icons.thumb_up, color: Colors.green),
              iconSize: 40,
            ),
            Text("$counterLikes"),
          ],
        ),
      ],
    );
  }
}
