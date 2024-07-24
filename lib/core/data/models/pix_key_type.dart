import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PixKeyType { none, cpf, cnpj, phone, email, random }
