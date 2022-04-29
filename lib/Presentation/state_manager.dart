import 'package:cubotest/Domain/Entities/products_entity.dart';
import 'package:cubotest/Domain/Interface/i_products.dart';
import 'package:get/get.dart';

import '../Data/Repository/products_repository.dart';

class StateManager extends GetxController{

  final IRepository repository=ProductsRepository();
  List<Product> listOfSavedPrducts=[];
  RxInt qtdOfItems=0.obs;
  RxBool loading=false.obs;
  RxDouble totalPrice=0.0.obs;


  fetchAllProducts()async {
   loading.value = true;
    listOfSavedPrducts=  await repository.fetchAllProducts();
   getTotalOfList();
   loading.value=false;
  }
  deleteProduct(product){
    listOfSavedPrducts.remove(product);
  repository.deleteProduct(product.id);
    getTotalOfList();

  }
  double getTotalOfList(){
    totalPrice.value=0;
    for (var element in listOfSavedPrducts) {
      element.price ??= 0.0;
      if(element.isSelected!) {
        totalPrice.value+=element.price!;
      }
    }
    qtdOfItems.value=listOfSavedPrducts.length;
    return totalPrice.value;
  }

}