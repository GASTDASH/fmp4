import 'package:flutter_svg/svg.dart';

class Item {
  const Item(this.image, this.title, this.subtitle);

  final SvgPicture image;
  final String title;
  final String subtitle;
}
