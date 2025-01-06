import 'package:flutter/material.dart';

import '../../domine/entities/character.dart';
import '../../utils/utils.dart';
import '../widgets/list_title_custom.dart';

class DetailCharacter extends StatelessWidget {
  final Character character;
  const DetailCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;

    final List<Map<String, String>> items = [
      {"title": "Status", "data": character.status.name},
      {"title": "Species", "data": character.species},
      {"title": "Gender", "data": character.gender.name},
      {"title": "Origin", "data": character.origin.name},
      {"title": "Location", "data": character.location.name},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style:
              textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
              textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Hero(
                tag: character.name,
                child: Image.network(
                  character.image,
                  fit: BoxFit.fitWidth,
                  width: width,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 8,
                  left: width * 0.05,
                  right: width * 0.05,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length * 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isEven) {
                      return const Divider();
                    } else {
                      final itemIndex = index ~/ 2; // Integer division
                      return ListTitleCustom(
                        title: items[itemIndex]['title']!,
                        data: items[itemIndex]['data']!,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}