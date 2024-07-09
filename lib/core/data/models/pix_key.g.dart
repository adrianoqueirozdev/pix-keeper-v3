// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixKeyModel _$PixKeyModelFromJson(Map<String, dynamic> json) => PixKeyModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      pixKeyType: $enumDecodeNullable(_$PixKeyTypeEnumMap, json['pixKeyType']),
      pixKeyTypeLabel: json['pixKeyTypeLabel'] as String?,
      favoredName: json['favoredName'] as String?,
      institutionIspb: json['institutionIspb'] as String?,
      institutionShortName: json['institutionShortName'] as String?,
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
      'pixKeyType': _$PixKeyTypeEnumMap[instance.pixKeyType],
      'pixKeyTypeLabel': instance.pixKeyTypeLabel,
      'favoredName': instance.favoredName,
      'institutionShortName': instance.institutionShortName,
      'institutionIspb': instance.institutionIspb,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'copiedAt': instance.copiedAt,
    };

const _$PixKeyTypeEnumMap = {
  PixKeyType.none: 'none',
  PixKeyType.cpf: 'cpf',
  PixKeyType.cnpj: 'cnpj',
  PixKeyType.phone: 'phone',
  PixKeyType.email: 'email',
  PixKeyType.random: 'random',
};
