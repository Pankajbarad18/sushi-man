// ignore_for_file: file_names

class Food {
  String name;
  String price;
  String imgpath;
  String rating;

  Food(
      {required this.name,
      required this.price,
      required this.rating,
      required this.imgpath});

  String get _name => name;
  String get _price => price;
  String get _rating => rating;
  String get _imgpath => imgpath;
}
