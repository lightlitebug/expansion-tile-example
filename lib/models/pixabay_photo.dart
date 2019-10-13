class PixabayStat {
  final int views;
  final int downloads;
  final int favorites;
  final int likes;
  final int comments;

  PixabayStat({
    this.views,
    this.downloads,
    this.favorites,
    this.likes,
    this.comments,
  });

  PixabayStat.fromJson(json)
      : this.views = json['views'],
        this.downloads = json['downloads'],
        this.favorites = json['favorites'],
        this.likes = json['likes'],
        this.comments = json['comments'];
}

class PixabayPhoto {
  final int id;
  final String user;
  final PixabayStat stat;
  final int webformatHeight;
  final int webformatWidth;
  final String webformatURL;
  final String userImageURL;

  PixabayPhoto({
    this.id,
    this.user,
    this.stat,
    this.webformatHeight,
    this.webformatWidth,
    this.webformatURL,
    this.userImageURL,
  });

  PixabayPhoto.fromJson(json)
      : this.id = json['id'],
        this.user = json['user'],
        this.stat = PixabayStat.fromJson(json),
        this.webformatHeight = json['webformatHeight'],
        this.webformatWidth = json['webformatWidth'],
        this.webformatURL = json['webformatURL'],
        this.userImageURL = json['userImageURL'];
}
