import 'package:flutter/material.dart';
// Responsive view method
double screenSize(context, {required TypeSize typeSize, required double size}) {
  final screenSize = MediaQuery.of(context).size;
  final double sHeight = (screenSize.width >
          screenSize.height -
              MediaQuery.of(context).viewPadding.top -
              MediaQuery.of(context).viewPadding.bottom)
      ? ((screenSize.height -
                  MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).viewPadding.bottom) *
              size) *
          2.4
      : ((screenSize.height -
              MediaQuery.of(context).viewPadding.top -
              MediaQuery.of(context).viewPadding.bottom) *
          size);
  final double sWidth = (screenSize.width -
          MediaQuery.of(context).viewPadding.left -
          MediaQuery.of(context).viewPadding.right) *
      size;
  if (typeSize == TypeSize.height) {
    return sHeight;
  } else if (typeSize == TypeSize.width) {
    return sWidth;
  } else {
    return 0.0;
  }
}

enum TypeSize { height, width }

//  Method to extract character identification.
List<int> extractIdsFromUrls(List<String> urls) {
  List<int> extractedIds = [];
  // Regular expression to capture numbers at the end of the string.
  RegExp exp = RegExp(r'(\d+)$'); 

  for (String url in urls) {
    var match = exp.firstMatch(url);
    if (match != null) {
      String idStr = match.group(1)!;
      extractedIds.add(int.parse(idStr));
    }
  }
  return extractedIds;
}
// Method to extact Season and Episode
String formatSingleEpisode(String episode) {
  RegExp exp = RegExp(
      r'S(\d+)E(\d+)'); 
 // Regular expression to capture Season and Episode parts
  var match = exp.firstMatch(episode);
  if (match != null) {
    String season = match.group(1)!;
    String episodeNumber = match.group(2)!;
    return 'Season: $season  Episode: $episodeNumber';
  } else {
    return 'Formato inválido';
  }
}