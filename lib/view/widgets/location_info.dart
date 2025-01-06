import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class LocationInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  const LocationInfo(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.focusColor))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.01),
              child: Icon(
                Icons.circle,
                size: 10,
                color: theme.shadowColor,
              ),
            ),
            Text(
              "$title:",
              maxLines: 2,
               style:
                textTheme.titleLarge!.copyWith( fontSize: width * 0.04,),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Text(
                subtitle,
                style:
                textTheme.titleLarge!.copyWith( fontSize: width * 0.05,),
                maxLines: 2,
                textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}