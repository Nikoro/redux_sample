import 'package:json_annotation/json_annotation.dart';
import 'package:redux_sample/data/models/user.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  Page({required this.data});

  final List<User> data;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
