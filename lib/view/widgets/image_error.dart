import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_characters/characters_bloc.dart';
import '../../blocs/bloc_episodes/episodes_bloc.dart';
import '../../blocs/bloc_location/location_bloc.dart';
import '../../utils/utils.dart';


class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final blocCharacter = context.read<CharactersBloc>();
    final blocEpisodes = context.read<EpisodesBloc>();
    final blocLocation = context.read<LocationBloc>();
    return Stack(
      children: [
        Image.network( 
            "urlImage",
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
              return Image.asset("assets/images/notLoad.jpeg",
              fit: BoxFit.cover,
              );
            }           
        ),
        Positioned(
          left: width / 2,
          bottom: width / 2,
          child: ElevatedButton(onPressed: (){            
            blocCharacter.add(InitCharacterBloc());
            blocEpisodes.add(InitEpisodesBloc());
            blocLocation.add(InitLocationBloc());
          }, 
          autofocus: true,
          child: const Text("Try again")),
          )
      ],
    );
  }
}