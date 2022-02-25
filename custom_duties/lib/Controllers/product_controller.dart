import 'package:custom_duties/Modals/modals.dart';
import 'package:custom_duties/Services/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  //final containerWidget = ContainerWidget().obs;
  var productList = <Products>[].obs;
  var searchList = <Products>[].obs;
   var searchValue = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    isLoading(true);
    try{
      var products = await RemoteServiece.getData();
    productList.value = products;
} finally {
      isLoading(false);
    }
  }

  // search products
  searchProducts(String search) {
    searchValue.value = search;
    if(search.isEmpty){
      searchList.value = [];
      //containerWidget.value;
      return;
    }
   var products = productList
        .where((product) => product.cdescription.toLowerCase().contains(search.toLowerCase()))
        .toList();

  searchList.value = products;
  }
}