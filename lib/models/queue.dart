import 'dart:collection';
import 'dart:convert';

import 'package:fmp4/main.dart';
import 'package:fmp4/models/queue_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OBQueue {
  void setQueue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? itemsJson = <String>[];

    print("=========================== $itemsJson");
    print("${itemsJson.isEmpty}");

    for (var item in queue) {
      itemsJson.add(jsonEncode(item.toJson()));
    }

    prefs.remove("items");
    prefs.setStringList("items", itemsJson);
  }

  void next() {
    queue.removeFirst();

    setQueue();
  }

  void skip() {
    while (queue.isNotEmpty) queue.removeFirst();

    setQueue();
  }

  String getImage() {
    return queue.isNotEmpty ? queue.first.imageAsset : "";
  }

  String getTitle() {
    return queue.isNotEmpty ? queue.first.title : "";
  }

  getSubtitle() {
    return queue.isNotEmpty ? queue.first.subtitle : "";
  }

  isLast() {
    return queue.length == 1;
  }
}
