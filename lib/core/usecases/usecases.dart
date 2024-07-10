abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  Future<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  Future<Type> call();
}
