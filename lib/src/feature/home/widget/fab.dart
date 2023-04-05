import 'package:flutter/material.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.only(right: constraints.maxWidth >= 165 ? 20 : 0),
        child: ElevatedButton(
          onPressed: () {},
          child: Align(
            child: Text(
              constraints.maxWidth >= 165 ? 'Write' : '✍️',
            ),
          ),
        ),
      ),
    );
  }
}
