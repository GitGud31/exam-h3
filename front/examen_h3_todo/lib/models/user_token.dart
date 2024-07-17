import 'dart:convert';

class UserToken {
    final String token;
    final String email;
    final String profiles;
    final int expiration;

    UserToken({
        required this.token,
        required this.email,
        required this.profiles,
        required this.expiration,
    });

    UserToken copyWith({
        String? token,
        String? email,
        String? profiles,
        int? expiration,
    }) => 
        UserToken(
            token: token ?? this.token,
            email: email ?? this.email,
            profiles: profiles ?? this.profiles,
            expiration: expiration ?? this.expiration,
        );

    factory UserToken.fromJson(String str) => UserToken.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserToken.fromMap(Map<String, dynamic> json) => UserToken(
        token: json["token"],
        email: json["email"],
        profiles: json["profiles"],
        expiration: json["expiration"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "email": email,
        "profiles": profiles,
        "expiration": expiration,
    };
}
