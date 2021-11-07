// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['results'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'results': instance.results,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['seed'] as String,
      json['id'] as String,
      Contact.fromJson(json['contact'] as Map<String, dynamic>),
      json['name'] as String,
      json['age'] as int,
      json['photo'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'seed': instance.seed,
      'id': instance.id,
      'contact': instance.contact,
      'name': instance.name,
      'age': instance.age,
      'photo': instance.photo,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      json['streetAddress'] as String,
      json['city'] as String,
      json['country'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'country': instance.country,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
