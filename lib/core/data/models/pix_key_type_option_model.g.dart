// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_key_type_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixKeyTypeOptionModel _$PixKeyTypeOptionModelFromJson(
        Map<String, dynamic> json) =>
    PixKeyTypeOptionModel(
      pixKeyType: $enumDecodeNullable(_$PixKeyTypeEnumMap, json['pixKeyType']),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$PixKeyTypeOptionModelToJson(
        PixKeyTypeOptionModel instance) =>
    <String, dynamic>{
      'pixKeyType': _$PixKeyTypeEnumMap[instance.pixKeyType],
      'label': instance.label,
    };

const _$PixKeyTypeEnumMap = {
  PixKeyType.none: 'none',
  PixKeyType.cpf: 'cpf',
  PixKeyType.cnpj: 'cnpj',
  PixKeyType.phone: 'phone',
  PixKeyType.email: 'email',
  PixKeyType.random: 'random',
};
