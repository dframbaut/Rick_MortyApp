import 'package:flutter/material.dart';
import '../../domine/entities/epidode.dart';

class CardEpisode extends StatelessWidget {
  final Episode episode;
  final void Function()? onTap;
  const CardEpisode(
      {Key? key, required this.episode, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.cardColor,
            boxShadow:  [
              BoxShadow(
                  color:theme.shadowColor,
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0.0, 4.0)
                  // offset: Offset(0, 10),
                  ),
            ]),
        child: ListTile(
          onTap: onTap,
          title: Text(
            episode.name,
            style: textTheme.bodyLarge,
          ),
          subtitle: Text(
            episode.episode,
            style: textTheme.bodySmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}