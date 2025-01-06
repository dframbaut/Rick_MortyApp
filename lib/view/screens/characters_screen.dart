import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_characters/characters_bloc.dart';
import '../../utils/utils.dart';
import '../widgets/animations/animation_fade.dart';
import '../widgets/card_character.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/pagination_controls.dart';
import 'detail_character_page.dart';


class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
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
         final bloc = context.read<CharactersBloc>();
         bloc.add(IsRequeringData(true));
        }
       });
  }

  @override 
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocCharacter = context.watch<CharactersBloc>(); 
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    return Scaffold( 

      appBar: CustomAppBar(textTheme: textTheme,titleAppBar: "Characters",),
      body: Stack(
        children: [
          GridView.builder(
            controller: scrollController,
            itemCount: blocCharacter.state.characterList?.length?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: width * 0.65),
            itemBuilder: (context, index) {
              return FadeAnimation(
                child: CardCharacter(
                  character: blocCharacter.state.characterList![index],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DetailCharacter(character: blocCharacter.state.characterList![index],)));
                  },
                ),
              );
            },
          ),
          blocCharacter.state.isRequeringData! ?          
            PaginatonControls(onPressed:  ()async{
                  final blocCharacterRead = context.read<CharactersBloc>();
                  blocCharacterRead.add(AddNextPageOfCharactersBloc(blocCharacterRead.state.currentPage! + 1));
                  await Future.delayed(const Duration(milliseconds: 600),(){
                    scrollController.animateTo(
                      scrollController.position.pixels + 100,
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.easeInOut, 
                    );
                  blocCharacterRead.add(IsRequeringData(false));
                  });
                }):
             const Center(),
        ],
      ),
    );
  }
}