class NewsData {
    List<Article> articles;
    String status;
    int totalResults;

    NewsData({this.articles, this.status, this.totalResults});

    factory NewsData.fromJson(Map<String, dynamic> json) {
        return NewsData(
            articles: json['articles'] != null ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList() : null, 
            status: json['status'], 
            totalResults: json['totalResults'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        data['totalResults'] = this.totalResults;
        if (this.articles != null) {
            data['articles'] = this.articles.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Article {
    String author;
    String content;
    String description;
    String publishedAt;
    Source source;
    String title;
    String url;
    String urlToImage;

    Article({this.author, this.content, this.description, this.publishedAt, this.source, this.title, this.url, this.urlToImage});

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            author: json['author'], 
            content: json['content'], 
            description: json['description'], 
            publishedAt: json['publishedAt'], 
            source: json['source'] != null ? Source.fromJson(json['source']) : null, 
            title: json['title'], 
            url: json['url'], 
            urlToImage: json['urlToImage'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['author'] = this.author;
        data['content'] = this.content;
        data['description'] = this.description;
        data['publishedAt'] = this.publishedAt;
        data['title'] = this.title;
        data['url'] = this.url;
        data['urlToImage'] = this.urlToImage;
        if (this.source != null) {
            data['source'] = this.source.toJson();
        }
        return data;
    }
}

class Source {
    String id;
    String name;

    Source({this.id, this.name});

    factory Source.fromJson(Map<String, dynamic> json) {
        return Source(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}