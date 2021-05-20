class ApiFactory {
  static String BASE_URL = 'https://fakestoreapi.com/products';
  static String ALL_CATEGORY = BASE_URL + '/categories';
  static String ALL_PRODUCT = BASE_URL;

  //static String BRIEF_BY_CATEGORY = BASE_URL+;
  static String FILETR_BY_CATEGORY({String crID}) {
    return BASE_URL+"/category/" + crID;
  }

  static String BRIEF_BY_CATEGORY({String prId}) {
    return BASE_URL+"/" + prId;
  }
}
/*

(i) API 1 - Get All Categories
https://fakestoreapi.com/products/categories
(ii) API 2 - Get All Products
https://fakestoreapi.com/products
(ii) API 3 - Get All Products By Category
https://fakestoreapi.com/products/category/jewelery
(ii) API 4 - Get All Products By Category
https://fakestoreapi.com/products/5
*/
