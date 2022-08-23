import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const TextButton(
        onPressed: null,
        child: Text("Site oficial"),
      ),
      actions: const [
        TextButton(
          onPressed: null,
          child: Text("Avatar"),
        )
      ],
    );
  }
}
