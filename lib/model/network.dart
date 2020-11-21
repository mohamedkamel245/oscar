class NetworkUrl {
  static String url = "http://dzs.rcl.mybluehost.me/oscar/api";
  // // static String getProduct() {
  // //   return "$url/getProduct.php";
  // }

  static String getProductCategory() {
    return "$url/categories.php";
  }
    static String getProductCategory2() {
    return "$url/a.php";
  }
     static String getfavoriteS(String deviceInfo) {
    return "$url/getfavorite.php?deviceInfo=$deviceInfo";
  }
   static String addfavoriteS() {
    return "$url/addfavorite.php";
  }
     static String getp() {
    return "$url/productsCat.php";
  }
}
