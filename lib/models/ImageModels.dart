class ImageModels{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  // ImageModels(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  ImageModels.fromJson(Map<String, dynamic> parsedJson){
    albumId = parsedJson['albumId'];
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
    thumbnailUrl = parsedJson['thumbnailUrl'];
  }
}