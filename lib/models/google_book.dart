class GoogleBook {
  late String id;
  late String title;
  late String authors;
  late String description;
  late String thumbnailLink;

  GoogleBook({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnailLink,
  });

  GoogleBook.fromApi(Map<String, dynamic> map) {
    id = map["id"];
    validadeTitle(map);
    validadeAuthors(map);
    validadeDescription(map);
    validadeThumbnail(map);
  }

  void validadeThumbnail(Map<String, dynamic> map) {
    thumbnailLink = map["volumeInfo"]["imageLinks"]?["thumbnail"] ?? "https://placehold.co/200x290.png";
  }

  void validadeDescription(Map<String, dynamic> map) {
    description = map["volumeInfo"]["description"] ?? "Sem descrição";
  }

  void validadeAuthors(Map<String, dynamic> map) {
    authors = map["volumeInfo"]["authors"] == null ? "Autor desconhecido" : (map["volumeInfo"]["authors"] as List<dynamic>).map((e) => e).toString();
  }

  void validadeTitle(Map<String, dynamic> map) {
     title = map["volumeInfo"]["title"] ?? "Título desconhecido";
  }

  GoogleBook.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    authors = map["authors"];
    description = map["description"];
    thumbnailLink = map["thumbnailLink"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "description": description,
      "thumbnailLink": thumbnailLink,
    };
  }
}
