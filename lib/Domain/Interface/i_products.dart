abstract class IRepository{
  dynamic fetchAllProducts();
  dynamic insertProduct(data);
  dynamic deleteProduct(id);
}