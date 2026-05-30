import 'package:basic/generated/configuration/Utils.pb.dart';

class ConstantVector2<T extends num> {
  final T x;
  final T y;

  const ConstantVector2(this.x, this.y);

  static ConstantVector2<int> fromProto(ProtoVector2 protoVector2) {
    return ConstantVector2<int>(protoVector2.x, protoVector2.y);
  }
}

class ConstantVector3<T extends num> {
  final T x;
  final T y;
  final T z;

  const ConstantVector3(this.x, this.y, this.z);

  static ConstantVector3 fromProto(ProtoVector3 protoVector3) {
    return ConstantVector3(protoVector3.x, protoVector3.y, protoVector3.z);
  }
}

class ConstantVector4<T extends num> {
  final T x;
  final T y;
  final T z;
  final T w;

  const ConstantVector4(this.x, this.y, this.z, this.w);
}