import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    bool response;
    Content content;

    RegisterModel({
        this.response,
        this.content,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        response: json["response"],
        content: Content.fromJson(json["content"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
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
