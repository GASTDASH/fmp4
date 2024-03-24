import 'dart:collection';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/models/onboarding_item.dart';

class OB {
  const OB(this.queue);

  final Queue<Item> queue;

  void next() {
    queue.removeFirst();
  }

  void skip() {
    while (queue.isNotEmpty) queue.removeFirst();
  }

  SvgPicture? getImage() {
    return queue.isNotEmpty ? queue.first.image : null;
  }

  String getTitle() {
    return queue.isNotEmpty ? queue.first.title : "";
  }

  String getSubtitle() {
    return queue.isNotEmpty ? queue.first.subtitle : "";
  }

  bool isLast() {
    return queue.length == 1;
  }

  int getLength() {
    return queue.length;
  }

  bool isEmpty() {
    return queue.isEmpty;
  }
}
