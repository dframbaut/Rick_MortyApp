import 'package:flutter/material.dart';

import '../../utils/utils.dart';


class PaginatonControls extends StatelessWidget {
  final void Function()? onPressed;
  const PaginatonControls({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
     final theme = Theme.of(context);
    return  Positioned(
          bottom: width * 0.05,
          right:  width * 0.05,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Text("Next Page", 
                  style: TextStyle(color: theme.shadowColor, 
                    backgroundColor: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w600
                    ),)),
              FloatingActionButton(onPressed: onPressed, child: const Icon(Icons.next_plan_sharp)),
            ],
          )) ;
  }
}