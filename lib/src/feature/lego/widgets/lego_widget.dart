import 'package:flutter/material.dart';

class LegoWidget extends StatelessWidget {
  const LegoWidget({
    required this.title,
    required this.titleIcon,
    required this.child,
    super.key,
  });
  final Widget child;
  final Text title;
  final Widget titleIcon;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                fontFamily: 'TT Norm Pro',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                children: [
                  Expanded(child: title),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: 'TT Norm Pro',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                    child: SizedBox(
                      child: titleIcon,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
