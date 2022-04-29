import 'package:cubotest/Domain/Entities/products_entity.dart';
import 'package:get/get.dart';

import '../Data/ProductsController/products_controller.dart';

class StateManager extends GetxController{

  ProductsController productsController=ProductsController();
  List<Product> listOfSavedPrducts=[];
  RxInt qtdOfItems=0.obs;
  RxBool loading=false.obs;
RxDouble totalPrice=0.0.obs;


  fetchAllProducts()async {
   loading.value = true;
    listOfSavedPrducts=  await productsController.repository.fetchAllProducts();
   getTotalOfList();
   loading.value=false;
  }
  deleteData(product){
    listOfSavedPrducts.remove(product);
    productsController.repository.deleteProduct(product.id);
    getTotalOfList();

  }
  double getTotalOfList(){
    totalPrice.value=0;
    for (var element in listOfSavedPrducts) {
      if( element.price==null)element.price=0.0;
      if(element.isSelected!)
      totalPrice.value+=element.price!;
    }
    qtdOfItems.value=listOfSavedPrducts.length;
    return totalPrice.value;
  }

}