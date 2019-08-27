import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'built_post.g.dart';

abstract class BuiltPost implements Built<BuiltPost, BuiltPostBuilder> {
  //@formatter:off
  @nullable int    get userId;
  @nullable int    get id;
  @nullable String get title;
  @nullable String get body;
  //@formatter:on

  BuiltPost._();

  factory BuiltPost([updates(BuiltPostBuilder b)]) = _$BuiltPost;

  static Serializer<BuiltPost> get serializer => _$builtPostSerializer;
}