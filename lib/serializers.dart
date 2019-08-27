import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:diabetist_pro/posts/built_post.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [BuiltPost])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
