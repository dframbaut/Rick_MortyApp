import 'package:flutter/material.dart';

class ListTitleCustom extends StatelessWidget {
  const ListTitleCustom({
    super.key,
    required this.title,
    required this.data,
  });
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(flex: 2, child: 
        Text(title, style: theme.textTheme.titleLarge)),
        const Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            data,
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}