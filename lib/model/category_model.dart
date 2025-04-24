
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<Category>? categories;
    String? bannerImage;
    String? status;
    String? message;

    CategoryModel({
        this.categories,
        this.bannerImage,
        this.status,
        this.message,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
        bannerImage: json["banner_image"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "banner_image": bannerImage,
        "status": status,
        "message": message,
    };
}

class Category {
    String? categoryId;
    String? categoryName;
    String? parentId;
    List<Category>? child;

    Category({
        this.categoryId,
        this.categoryName,
        this.parentId,
        this.child,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
        child: json["child"] == null ? [] : List<Category>.from(json["child"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "parent_id": parentId,
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
    };
}
