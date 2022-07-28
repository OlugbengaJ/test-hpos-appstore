abstract class Comparer {
  /// [Comparer] checks if two objects are exactly the same.
  ///
  /// To use, add extends on the class and invoke super on its constructor e.g.
  /// ```
  ///  class MyClass extends Comparer {
  ///    final String name;
  ///    bool enabled;
  ///
  ///    MyClass(this.name, this.enabled) : super(name);
  ///  }
  /// ```
  /// From example, MyClass is compared based on name.
  /// To compare a field of type class, ensure the other class extends comparer.
  const Comparer(this.v);

  /// [v] is the value used as comparison
  final dynamic v;

  @override
  bool operator ==(dynamic other) => other is Comparer && other.v == v;

  @override
  int get hashCode => v.hashCode;
}
