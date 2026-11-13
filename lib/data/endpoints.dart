class Endpoints {
  Endpoints._();

  static const String cats = '/images/search';

  static String breed(String id) => '/breeds/$id';
}
