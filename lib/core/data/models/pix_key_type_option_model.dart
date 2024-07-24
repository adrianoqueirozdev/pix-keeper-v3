import 'package:json_annotation/json_annotation.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';

part 'pix_key_type_option_model.g.dart';

@JsonSerializable()
class PixKeyTypeOptionModel {
  final PixKeyType? pixKeyType;
  final String? label;

  PixKeyTypeOptionModel({this.pixKeyType, this.label});

  factory PixKeyTypeOptionModel.fromJson(Map<String, dynamic> json) => _$PixKeyTypeOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PixKeyTypeOptionModelToJson(this);

  PixKeyTypeOptionModel copyWith({
    PixKeyType? pixKeyType,
    String? label,
  }) {
    return PixKeyTypeOptionModel(
      pixKeyType: pixKeyType ?? this.pixKeyType,
      label: label ?? this.label,
    );
  }
}
