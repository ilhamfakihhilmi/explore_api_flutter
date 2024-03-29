class Sample {
  final String? name;
  final int? age;
  final List<String>? hobby;
  final Github? github;
  final List<Article>? articles;

// ini constactor
// named parameter yang diawali dengan kurung kurawal
  Sample({this.name, this.age, this.hobby, this.github, this.articles});
// OBJECT MODEL LIST
  // factory Sample.fromJson(Map<String, dynamic> json) {
  //   return Sample(
  //       name: json["name"] ?? "",
  //       age: json["age"] ?? "",
  //       hobby: List<String>.from(json["hobby"] ?? []),
  //       alamat: json["alamat"] ?? "");
  // }
  
  // ini method fromJson
  // factory wajib mereturn object sample
  // map parameternya selalu string, dinamic artinya dinamis apabila lebih dari satu data(disini string dan int)
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      //key='name','age', dll yang ada dalam list
      // ini kelas model
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      //list di panggil menggunakan menggunakan from
      hobby: List<String>.from(json['hobby'] ?? []),
      github: Github.fromJson(json["github"]),
      articles: List<Article>.from(
          json["articles"].map((article) => Article.fromJson(article))),
    );
  }

  @override
  String toString() {
    return 'Sample(name: $name, age: $age, hobby: $hobby, github: $github, articles: $articles)';
  }
}

//OBJECT MODEL MAP

class Github {
  final String? username;
  final int? repositories;
  final bool? isGDE;

  Github({this.username, this.repositories, this.isGDE});

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(
        username: json["username"],
        repositories: json["repositories"],
        isGDE: json["isGDE"]);
  }

  @override
  String toString() =>
      'Github(username: $username, repositories: $repositories, isGDE: $isGDE)';
}

class Article {
  final int? id;
  final String? title;
  final String? subtitle;

  Article({
    this.id,
    this.title,
    this.subtitle,
  });

//method of json
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      subtitle: json["subtitle"] ?? '',
    );
  }

  @override
  String toString() => 'Article(id: $id, title: $title, subtitle: $subtitle)';
}
