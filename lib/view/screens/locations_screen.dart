import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_location/location_bloc.dart';
import '../widgets/card_location.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/pagination_controls.dart';
import 'detail_location.dart';


class LocationsSreen extends StatefulWidget {
   const LocationsSreen({Key? key});

  @override
  State<LocationsSreen> createState() => _LocationsSreenState();
}

class _LocationsSreenState extends State<LocationsSreen> {
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
         final bloc = context.read<LocationBloc>();
         bloc.add(IsRequeringData(true));
        }
       });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocLocation = context.watch<LocationBloc>(); 

    return Scaffold(
      appBar: CustomAppBar(textTheme: textTheme,titleAppBar: "Locations",),
      body: Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: ListView.builder(
               controller: scrollController,
                itemCount: blocLocation.state.locationsList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardLocation(
                    location: blocLocation.state.locationsList![index],
                    onTap: () {
                      final blocResidents = context.read<LocationBloc>();
                      blocResidents.add(AddResidents( blocLocation.state.locationsList![index].residents));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailLocation(location: blocLocation.state.locationsList![index],)));
                    },
                  );
                }),
          ),   
        ],
      ),  
      blocLocation.state.isRequeringData! ?          
      PaginatonControls(onPressed:  ()async{
            final blocLocationrRead = context.read<LocationBloc>();
            blocLocationrRead.add(AddNextPageOfLocationBloc(blocLocationrRead.state.currentPage! + 1));
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
    );
  }
}