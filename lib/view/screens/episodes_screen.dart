import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_episodes/episodes_bloc.dart';
import '../widgets/card_episodes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/pagination_controls.dart';
import 'detail_episode.dart';


class EpisodesPage extends StatefulWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    loadNewData();
    super.initState();
  }

  void loadNewData(){
    scrollController.addListener(() {
        if (scrollController.position.pixels + 300 >= 
        scrollController.position.maxScrollExtent &&
        scrollController.position.pixels  <= 
        scrollController.position.maxScrollExtent
        ){
         final bloc = context.read<EpisodesBloc>();
         bloc.add(IsRequeringData(true));
        }
       });
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocEpisodes = context.watch<EpisodesBloc>();

    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(textTheme: textTheme,titleAppBar: "Episodes",),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                   controller: scrollController,
                    itemCount: blocEpisodes.state.episodesList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardEpisode(
                        episode: blocEpisodes.state.episodesList![index],
                        onTap: () {
                          final blocEpisodes = context.read<EpisodesBloc>();
                          blocEpisodes.add(AddCharacterOfEpisodeEvent( blocEpisodes.state.episodesList![index].characters));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>DetailEpisode(episode: blocEpisodes.state.episodesList![index],),
                              ));
                        },
                      );
                    }),
              )
            ],
          ),
          blocEpisodes.state.isRequeringData! ?          
      PaginatonControls(onPressed:  ()async{
            final blocLocationrRead = context.read<EpisodesBloc>();
            blocLocationrRead.add(AddNextPageOfEpisodesBloc(blocLocationrRead.state.currentPage! + 1));
            await Future.delayed(const Duration(milliseconds: 600),(){
               scrollController.animateTo(
                      scrollController.position.pixels + 100,
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.easeInOut, 
                    );
            blocLocationrRead.add(IsRequeringData(false));
            });
          }):
       const Center(),
        ],
      ),
    ));
  }
}

