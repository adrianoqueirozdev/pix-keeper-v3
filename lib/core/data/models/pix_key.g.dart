// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixKeyModel _$PixKeyModelFromJson(Map<String, dynamic> json) => PixKeyModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      key: json['key'] as String?,
      pixKeyType: json['pixKeyType'] as String?,
      favoredName: json['favoredName'] as String?,
      institution: json['institution'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      copiedAt: json['copiedAt'] as String?,
    );

Map<String, dynamic> _$PixKeyModelToJson(PixKeyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'pixKeyType': instance.pixKeyType,
      'favoredName': instance.favoredName,
      'institution': instance.institution,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'copiedAt': instance.copiedAt,
    };
