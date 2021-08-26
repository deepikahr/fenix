mixin BaseModel<T> {
  T fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap();
}
