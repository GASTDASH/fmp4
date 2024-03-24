import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YandexMap examples')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(8), child: const YandexMap()),
          ),
        ],
      ),
    );
  }
}
