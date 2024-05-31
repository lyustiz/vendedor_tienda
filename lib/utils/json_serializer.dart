import 'dart:typed_data';

class JsonSerializer extends ValueSerializer {
  const JsonSerializer();

  @override
  fromJson<T>(dynamic json) {
    if (json == null) {
      return null as T;
    }

    final typeList = <T>[];

    if (typeList is List<DateTime?>) {
      return DateTime.parse(json as String) as T;
    }

    if (typeList is List<double?> && json is int) {
      return json.toDouble() as T;
    }

    if (typeList is List<Uint8List?> && json is! Uint8List) {
      final asList = (json as List).cast<int>();
      return Uint8List.fromList(asList) as T;
    }

    if (typeList is List<bool?> && json is! bool) {
      return (json == 1) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.toIso8601String();
    }

    return value;
  }
}

abstract class ValueSerializer {
  /// Constant super-constructor to allow constant child classes.
  const ValueSerializer();

  /// The builtin default serializer.
  ///
  /// This serializer won't transform numbers or strings. Date times will be
  /// encoded as a unix-timestamp.
  ///
  /// To override the default serializer drift uses, you can change the
  /// [DriftRuntimeOptions.defaultSerializer] field.
  const factory ValueSerializer.defaults() = _DefaultValueSerializer;

  /// Converts the [value] to something that can be passed to
  /// [JsonCodec.encode].
  dynamic toJson<T>(T value);

  /// Inverse of [toJson]: Converts a value obtained from [JsonCodec.decode]
  /// into a value that can be hold by data classes.
  T fromJson<T>(dynamic json);
}

class _DefaultValueSerializer extends ValueSerializer {
  const _DefaultValueSerializer();

  @override
  T fromJson<T>(dynamic json) {
    if (json == null) {
      return null as T;
    }

    final typeList = <T>[];

    if (typeList is List<DateTime?>) {
      return DateTime.fromMillisecondsSinceEpoch(json as int) as T;
    }

    if (typeList is List<double?> && json is int) {
      return json.toDouble() as T;
    }

    // blobs are encoded as a regular json array, so we manually convert that to
    // a Uint8List
    if (typeList is List<Uint8List?> && json is! Uint8List) {
      final asList = (json as List).cast<int>();
      return Uint8List.fromList(asList) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    }

    return value;
  }
}
