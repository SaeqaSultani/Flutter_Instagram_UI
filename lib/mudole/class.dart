class User{
  int id;
  String family;

  User({required this.id, required this.family});
}


class Post{
  int userId;
  int id;
  String title;
  int userLike;
  int like;
  int comments;

  Post({required this.userId,required this.id,required this.title,required this.userLike,required this.like,required this.comments});
}