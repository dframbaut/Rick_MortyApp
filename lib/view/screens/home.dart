import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_bottom_bar/bottom_bar_bloc.dart';
import '../../blocs/bloc_characters/characters_bloc.dart';
import '../widgets/image_error.dart';
import '../widgets/tab_view.dart';
import 'characters_screen.dart';
import 'episodes_screen.dart';
import 'locations_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blocCharacter = context.watch<CharactersBloc>(); 
    final blocBottomBar = context.watch<BottomBarBloc>(); 
    final updateBottomBar = context.read<BottomBarBloc>();
    final namePage = ["Characters", "Locations", "Episodes"];
    final iconPage = [ const Icon(Icons.person), const Icon(Icons.fmd_good_sharp), const Icon(Icons.movie)];
    final onTap = [(){updateBottomBar.add(ChangeIndex(0));},
                    (){updateBottomBar.add(ChangeIndex(1));},
                    (){updateBottomBar.add(ChangeIndex(2));}];
    final page =  [const CharacterScreen(), const LocationsSreen(), const EpisodesPage()];
    // final data =  DataSourceImpRickAndMorty().getCharacter(1);
    return 
    Scaffold(               
        body: blocCharacter.state.characterList != null ?
         page[blocBottomBar.state.pageIndex]:
         const ImageError(),
        bottomNavigationBar: 
        CustomBottomNavigationBar(
          titles: namePage,
          icons: iconPage,         
          ontaps: onTap),
      );
  }
}