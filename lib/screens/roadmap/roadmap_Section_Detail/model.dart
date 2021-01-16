// To parse this JSON data, do
//
//     final roadmapSectionModel = roadmapSectionModelFromJson(jsonString);

import 'dart:convert';

RoadmapSectionModel roadmapSectionModelFromJson(String str) => RoadmapSectionModel.fromJson(json.decode(str));

String roadmapSectionModelToJson(RoadmapSectionModel data) => json.encode(data.toJson());

class RoadmapSectionModel {
    RoadmapSectionModel({
        this.success,
        this.roadmap,
        this.roadmapsections,
    });

    bool success;
    Roadmap roadmap;
    List<Roadmapsection> roadmapsections;

    factory RoadmapSectionModel.fromJson(Map<String, dynamic> json) => RoadmapSectionModel(
        success: json["Success"],
        roadmap: Roadmap.fromJson(json["roadmap"]),
        roadmapsections: List<Roadmapsection>.from(json["roadmapsections"].map((x) => Roadmapsection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": success,
        "roadmap": roadmap.toJson(),
        "roadmapsections": List<dynamic>.from(roadmapsections.map((x) => x.toJson())),
    };
}

class Roadmap {
    Roadmap({
        this.id,
        this.name,
        this.author,
        this.description,
        this.image,
        this.visitorsCount,
        this.slug,
    });

    int id;
    String name;
    Author author;
    String description;
    String image;
    int visitorsCount;
    String slug;

    factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        id: json["id"],
        name: json["name"],
        author: Author.fromJson(json["author"]),
        description: json["description"],
        image: json["image"],
        visitorsCount: json["visitors_count"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author.toJson(),
        "description": description,
        "image": image,
        "visitors_count": visitorsCount,
        "slug": slug,
    };
}

class Author {
    Author({
        this.username,
    });

    String username;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
    };
}

class Roadmapsection {
    Roadmapsection({
        this.id,
        this.name,
        this.description,
        this.image,
        this.order,
        this.link,
        this.roadmap,
    });

    int id;
    String name;
    String description;
    String image;
    int order;
    dynamic link;
    int roadmap;

    factory Roadmapsection.fromJson(Map<String, dynamic> json) => Roadmapsection(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        order: json["order"],
        link: json["link"],
        roadmap: json["roadmap"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "order": order,
        "link": link,
        "roadmap": roadmap,
    };
}
