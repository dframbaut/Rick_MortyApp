import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_episodes/episodes_bloc.dart';
import '../../domine/entities/epidode.dart';
import '../../utils/utils.dart';
import '../widgets/animations/animation_fade.dart';
import '../widgets/location_info.dart';
import 'detail_character_page.dart';

class DetailEpisode extends StatelessWidget {
  final Episode episode;
  const DetailEpisode({Key? key,  required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "Official Name", "data": episode.name},
      {"title": "Launch Date", "data": episode.airDate},
      {"title": formatSingleEpisode(episode.episode), "data": ""},
    ];
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;
     final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          episode.name,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Text("Properties", style: textTheme.titleLarge),
            const SizedBox(height: 10),
            ...items
                .map((item) => LocationInfo(
                    title: item["title"]!, subtitle: item["data"]!))
                .toList(),
            const SizedBox(height: 10),
            Text("Residents:", style: textTheme.titleLarge),
            const SizedBox(height: 10),
            BlocBuilder<EpisodesBloc, EpisodesState>(
              builder: (context, state) {  
                return Expanded(
                    child: GridView.builder(
                  itemCount: state.characterInEpisode?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                      mainAxisExtent: width * 0.4),
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      fadeType: FadeType.fadeInRigth,
                      child: InkWell(
                         onTap: () {                          
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DetailCharacter(character: state.characterInEpisode![index],)));
                          },
                        child: 
                        ClipRRect(                       
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(38),
                                child: Image.network(
                                    state.characterInEpisode![index].image),
                              ),
                              Text(
                                state.characterInEpisode![index].name,
                                style: TextStyle(color:  theme.disabledColor,),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
