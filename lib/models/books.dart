class Books {

  String title;
  String author;
  String genre;
  String createdAt;

  Books(
    {
      required this.title, 
      required this.author, 
      required this.genre
    }
    ) : createdAt = DateTime.now().toString();

  @override
  String toString() {
    return 'Title: $title\nAuthor: $author\nGenre: $genre\nCreated At: $createdAt';
  }
}