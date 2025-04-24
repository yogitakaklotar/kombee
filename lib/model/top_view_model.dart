

import 'dart:convert';

TopViewModel topViewModelFromJson(String str) => TopViewModel.fromJson(json.decode(str));

String topViewModelToJson(TopViewModel data) => json.encode(data.toJson());

class TopViewModel {
    List<MainStickyMenu>? mainStickyMenu;
    String? status;
    String? message;

    TopViewModel({
        this.mainStickyMenu,
        this.status,
        this.message,
    });

    factory TopViewModel.fromJson(Map<String, dynamic> json) => TopViewModel(
        mainStickyMenu: json["main_sticky_menu"] == null ? [] : List<MainStickyMenu>.from(json["main_sticky_menu"]!.map((x) => MainStickyMenu.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "main_sticky_menu": mainStickyMenu == null ? [] : List<dynamic>.from(mainStickyMenu!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class MainStickyMenu {
    String? title;
    String? image;
    String? sortOrder;
    List<MainStickyMenu>? sliderImages;
    String? cta;

    MainStickyMenu({
        this.title,
        this.image,
        this.sortOrder,
        this.sliderImages,
        this.cta,
    });

    factory MainStickyMenu.fromJson(Map<String, dynamic> json) => MainStickyMenu(
        title: json["title"],
        image: json["image"],
        sortOrder: json["sort_order"],
        sliderImages: json["slider_images"] == null ? [] : List<MainStickyMenu>.from(json["slider_images"]!.map((x) => MainStickyMenu.fromJson(x))),
        cta: json["cta"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "sort_order": sortOrder,
        "slider_images": sliderImages == null ? [] : List<dynamic>.from(sliderImages!.map((x) => x.toJson())),
        "cta": cta,
    };
}
