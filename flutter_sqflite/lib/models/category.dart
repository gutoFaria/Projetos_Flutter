class Category {
  int id;
  String name;
  String description;

  //Category(){}

  Category({required this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"name": name, "description": description};
  }
}
