const _basePath = 'assets/images';
const _corePath = '$_basePath/core';
const _customerPath = '$_basePath/customer';
const _adminPath = '$_basePath/admin';

class AppImageAssets {
  AppImageAssets._();
  //Images
  static const noNetwork = '$_corePath/no_network.jpg';
  static const pageUnderBuild = '$_corePath/page_under_build.jpg';
  static const emptyScreen = '$_corePath/empty_screen.png';

  // Customer
  static const userAvatar = '$_customerPath/user.png';
  static const bigIconNavBarDark = '$_customerPath/big_nav_bar_dark.png';
  static const bigIconNavBarLight = '$_customerPath/big_nav_bar_light.png';
  static const homeBgDark = '$_customerPath/home_bg_dark.png';
  static const homeBgLight = '$_customerPath/home_bg_light.png';

  // Admin
  static const drawerImage = '$_adminPath/drawer_image.png';
  static const categoriesDrawer = '$_adminPath/categories_drawer.png';
  static const productsDrawer = '$_adminPath/products_drawer.png';
  static const usersDrawer = '$_adminPath/users_drawer.png';
}
