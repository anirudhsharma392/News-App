

class Sources {
    List<Source> sources;
    String status;

    Sources({this.sources, this.status});

    factory Sources.fromJson(Map<String, dynamic> json) {
        return Sources(
            sources: json['sources'] != null ? (json['sources'] as List).map((i) => Source.fromJson(i)).toList() : null, 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        if (this.sources != null) {
            data['sources'] = this.sources.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Source {
    String category;
    String country;
    String description;
    String id;
    String language;
    String name;
    String url;

    Source({this.category, this.country, this.description, this.id, this.language, this.name, this.url});

    factory Source.fromJson(Map<String, dynamic> json) {
        return Source(
            category: json['category'], 
            country: json['country'], 
            description: json['description'], 
            id: json['id'], 
            language: json['language'], 
            name: json['name'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['country'] = this.country;
        data['description'] = this.description;
        data['id'] = this.id;
        data['language'] = this.language;
        data['name'] = this.name;
        data['url'] = this.url;
        return data;
    }
}