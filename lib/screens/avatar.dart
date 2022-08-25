import 'package:fluttermoji/fluttermoji.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Save"),
            FluttermojiSaveWidget(),
          ],
        ),
        FluttermojiCustomizer()
      ],
    );
  }
}
