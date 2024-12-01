class ImagesOnHomePage{
  final String? imgPath;

  ImagesOnHomePage({required this.imgPath});

  factory ImagesOnHomePage.fromJson(Map<String, dynamic> json) {
    return ImagesOnHomePage(
      imgPath: json['imgPath'] as String? 
    );
  }
}