import 'package:flutter/material.dart';
import '../../domine/entities/character.dart';
import '../../utils/utils.dart';

class CardCharacter extends StatelessWidget {
  final Character character;
  final void Function()? onTap;

  const CardCharacter(
      {Key? key,
      required this.character,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Hero(
                tag: character.name,
                child: Image.network(
                  character.image,
                  width: width * 0.477,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  character.name,
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                      maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    statusLive(character.status, theme),
                    Text(
                      character.status.name.toUpperCase(),
                      style: textTheme.bodyMedium,                      
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Icon statusLive(Status status, ThemeData theme) {
  switch (status) {
    case Status.alive:
      return Icon(Icons.sentiment_very_satisfied_outlined, color: theme.shadowColor);
    case Status.dead:
      return Icon(Icons.sentiment_very_dissatisfied_rounded, color: theme.disabledColor,);
    default:
      return const Icon(Icons.question_mark_rounded);
  }
}