import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'users_reponse.g.dart';

@JsonSerializable()
@immutable
class Result extends Equatable {
  final List<User>? results;

  const Result(this.results);

  @override
  List<Object?> get props => [results];

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
@immutable
class User extends Equatable {
  final String seed;
  final String id;
  final Contact contact;
  final String name;
  final int age;
  final String photo;

  const User(this.seed, this.id, this.contact, this.name, this.age, this.photo);

  @override
  List<Object?> get props => [seed, id, contact, name, age, photo];


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
@immutable
class Contact extends Equatable {
  final String streetAddress;
  final String city;
  final String country;
  final String email;
  final String phoneNumber;

  const Contact(this.streetAddress, this.city, this.country, this.email,
      this.phoneNumber);

  @override
  List<Object?> get props => [streetAddress, city, country, email, phoneNumber];


  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
