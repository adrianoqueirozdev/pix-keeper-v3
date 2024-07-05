// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants_pix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantPix _$ParticipantPixFromJson(Map<String, dynamic> json) =>
    ParticipantPix(
      id: (json['_id'] as num?)?.toInt(),
      ispb: json['ispb'] as String?,
      shortName: json['nome_reduzido'] as String?,
    );

Map<String, dynamic> _$ParticipantPixToJson(ParticipantPix instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'ispb': instance.ispb,
      'nome_reduzido': instance.shortName,
    };
