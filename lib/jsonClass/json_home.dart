import 'dart:convert';

class JsonShareItem {
    int id;
    String img;
    String title;
    String intro;
    String price;

    JsonShareItem({
        this.id,
        this.img,
        this.title,
        this.intro,
        this.price,
    });

    factory JsonShareItem.fromRawJson(String str) => JsonShareItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonShareItem.fromJson(Map<String, dynamic> json) => JsonShareItem(
        id: json["id"],
        img: json["img"],
        title: json["title"],
        intro: json["intro"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "title": title,
        "intro": intro,
        "price": price,
    };
}


class JsonRecItem {
    final int id;
    final String img;
    final String title;

    JsonRecItem({
        this.id,
        this.img,
        this.title,
    });

    factory JsonRecItem.fromRawJson(String str) => JsonRecItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonRecItem.fromJson(Map<String, dynamic> json) => JsonRecItem(
        id: json["id"],
        img: json["img"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "title": title,
    };
}

class JsonTagItem {
    final int id;
    final String name;
    final String img;

    JsonTagItem({
        this.id,
        this.name,
        this.img,
    });

    factory JsonTagItem.fromRawJson(String str) => JsonTagItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonTagItem.fromJson(Map<String, dynamic> json) => JsonTagItem(
        id: json["id"],
        name: json["name"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
    };
}

class JsonMallRecItem {
    final int id;
    final int price;
    final String name;
    final String img;

    JsonMallRecItem({
        this.id,
        this.price,
        this.name,
        this.img,
    });

    factory JsonMallRecItem.fromRawJson(String str) => JsonMallRecItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonMallRecItem.fromJson(Map<String, dynamic> json) => JsonMallRecItem(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "img": img,
    };
}

class JsonLocation {
    final int id;
    final String name;
    final String intro;
    final String time;
    final String img;

    JsonLocation({
        this.id,
        this.name,
        this.intro,
        this.time,
        this.img,
    });

    factory JsonLocation.fromRawJson(String str) => JsonLocation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonLocation.fromJson(Map<String, dynamic> json) => JsonLocation(
        id: json["id"],
        name: json["name"],
        intro: json["intro"],
        time: json["time"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "intro": intro,
        "time": time,
        "img": img,
    };
}

class JsonCartItem {
    final int id;
    final int price;
    final String name;
    final String img;
   int count;
   bool checked = false;
    JsonCartItem({
        this.id,
        this.price,
        this.count,
        this.name,
        this.img,
        this.checked,
    });

    factory JsonCartItem.fromRawJson(String str) => JsonCartItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JsonCartItem.fromJson(Map<String, dynamic> json) => JsonCartItem(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        img: json["img"],
        count:json['count'],
        checked:json['checked'],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "img": img,
        "count":count,
        "checked":checked
    };
}