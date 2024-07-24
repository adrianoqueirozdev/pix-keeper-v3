// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants_pix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantPixModel _$ParticipantPixModelFromJson(Map<String, dynamic> json) =>
    ParticipantPixModel(
      ispb: json['ispb'] as String?,
      shortName: json['nome_reduzido'] as String?,
    );

Map<String, dynamic> _$ParticipantPixModelToJson(
        ParticipantPixModel instance) =>
    <String, dynamic>{
      'ispb': instance.ispb,
      'nome_reduzido': instance.shortName,
    };
