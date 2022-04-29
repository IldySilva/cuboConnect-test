import 'package:cubotest/Data/dbConection.dart';
import 'package:cubotest/Domain/Interface/i_products.dart';


import '../../Domain/Entities/products_entity.dart';

class ProductsRepository implements IRepository {
  final  _appDB = AppDB();

  @override
  Future<List<Product>>  fetchAllProducts() async {
    List<Product> returnedList = [];
    var rows = await _appDB.fetchData();
    for (var productMap in rows) {
      var product = Product.fromMap(productMap);
      returnedList.add(product);
    }

    return returnedList;
  }

  @override
  void insertProduct(data) async {
    await _appDB.insertData(data);
  }
  @override
  void deleteProduct(id)async{
    await _appDB.deleteById(id);
  }
}
