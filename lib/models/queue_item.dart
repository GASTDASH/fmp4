class Item {
  const Item(
    this.imageAsset,
    this.title,
    this.subtitle,
  );

  final String imageAsset;
  final String title;
  final String subtitle;

  Map<String, dynamic> toJson() {
    return {
      "imageAsset": imageAsset,
      "title": title,
      "subtitle": subtitle,
    };
  }

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return new Item(
        parsedJson['imageAsset'], parsedJson['title'], parsedJson['subtitle']);
  }
}
