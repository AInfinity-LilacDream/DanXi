// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BBSPost _$BBSPostFromJson(Map<String, dynamic> json) {
  return BBSPost(
    json['id'] as int,
    json['first_post'] == null
        ? null
        : Reply.fromJson(json['first_post'] as Map<String, dynamic>),
    json['count'] as int,
    (json['tag'] as List)
        ?.map((e) =>
            e == null ? null : PostTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['mapping'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['date_created'] as String,
    json['date_updated'] as String,
  );
}

Map<String, dynamic> _$BBSPostToJson(BBSPost instance) => <String, dynamic>{
      'id': instance.id,
      'first_post': instance.first_post,
      'count': instance.count,
      'tag': instance.tag,
      'mapping': instance.mapping,
      'date_created': instance.date_created,
      'date_updated': instance.date_updated,
    };
