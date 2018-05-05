int hashObjects<T>(Iterable<T> objects) => objects == null
    ? objects.hashCode
    : objects.fold(0, (int h, T i) => combine(h, i.hashCode));

int combine(int hash, int value) {
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));

  return hash ^ (hash >> 6);
}

int finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);

  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
