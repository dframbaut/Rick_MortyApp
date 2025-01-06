import 'package:flutter/material.dart';

import '../../domine/entities/location.dart';


class CardLocation extends StatelessWidget {
  final Location location;
  final void Function()? onTap;
  const CardLocation(
      {Key? key, required this.location, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            location.name,
            style: textTheme.bodyLarge,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                location.type,
                style: textTheme.bodyMedium,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}