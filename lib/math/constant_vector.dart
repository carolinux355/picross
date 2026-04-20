class ConstantVector2<T extends num> {
  final T x;
  final T y;

  const ConstantVector2(this.x, this.y);
}

class ConstantVector3<T extends num> {
  final T x;
  final T y;
  final T z;

  const ConstantVector3(this.x, this.y, this.z);
}

class ConstantVector4<T extends num> {
  final T x;
  final T y;
  final T z;
  final T w;

  const ConstantVector4(this.x, this.y, this.z, this.w);
}