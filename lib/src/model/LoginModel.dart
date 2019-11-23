import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool response;
    Content content;

    LoginModel({
        this.response,
        this.content,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: json["reponse"],
        content: Content.fromJson(json["content"]),
    );

    Map<String, dynamic> toJson() => {
        "reponse": response,
        "content": content.toJson(),
    };
}

class Content {
    String userType;
    String id;
    String userName;
    String password;
    int hospitalId;
    int v;

    Content({
        this.userType,
        this.id,
        this.userName,
        this.password,
        this.hospitalId,
        this.v,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        userType: json["userType"],
        id: json["_id"],
        userName: json["userName"],
        password: json["password"],
        hospitalId: json["hospitalId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userType": userType,
        "_id": id,
        "userName": userName,
        "password": password,
        "hospitalId": hospitalId,
        "__v": v,
    };
}
