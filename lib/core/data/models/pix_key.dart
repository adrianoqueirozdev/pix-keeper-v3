import 'package:json_annotation/json_annotation.dart';

part 'pix_key.g.dart';

@JsonEnum()
enum PixKeyType { none, cpf, cnpj, phone, email, random }

@JsonSerializable()
class PixKeyModel {
  String? id;
  String? name;
  String? key;
  PixKeyType? pixKeyType;
  String? pixKeyTypeLabel;
  String? favoredName;
  String? institutionShortName;
  String? institutionIspb;
  bool? isFavorite;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? copiedAt;

  PixKeyModel({
    this.id,
    this.name,
    this.key,
    this.pixKeyType,
    this.pixKeyTypeLabel,
    this.favoredName,
    this.institutionIspb,
    this.institutionShortName,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.copiedAt,
  });

  PixKeyModel copyWith({
    String? id,
    String? name,
    String? key,
    PixKeyType? pixKeyType,
    String? pixKeyTypeLabel,
    String? favoredName,
    String? institutionShortName,
    String? institutionIspb,
    bool? isFavorite,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? copiedAt,
  }) {
    return PixKeyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      key: key ?? this.key,
      pixKeyType: pixKeyType ?? this.pixKeyType,
      pixKeyTypeLabel: pixKeyTypeLabel ?? this.pixKeyTypeLabel,
      favoredName: favoredName ?? this.favoredName,
      institutionIspb: institutionIspb ?? this.institutionIspb,
      institutionShortName: institutionShortName ?? this.institutionShortName,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      copiedAt: copiedAt ?? this.copiedAt,
    );
  }

  factory PixKeyModel.fromJson(Map<String, dynamic> json) => _$PixKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PixKeyModelToJson(this);
}

class PixKeyTypeOption {
  final PixKeyType? pixKeyType;
  final String? label;

  PixKeyTypeOption({this.pixKeyType, this.label});
}
