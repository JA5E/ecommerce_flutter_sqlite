// Example of how to use the DatabaseHelper class
import 'package:ecommerce_flutter/helpers/db_helper.dart';
import 'package:ecommerce_flutter/models/product_model.dart';

void main() async {
  var dbHelper = DatabaseHelper();

  // Insert a product
  await dbHelper.insertProduct(Product(
    image: 'image_path',
    category: 'Category',
    price: 10,
    ranking: 5,
    title: 'Product Title',
    description: 'Product Description',
    calories: 100,
    additives: 'Additives',
    vitamins: 'Vitamins',
  ));

  // Retrieve all products
  List<Product> products = await dbHelper.getProducts();
  print(products);


  // Retrieve all products after update
  products = await dbHelper.getProducts();
  print(products);

  // Delete a product
  await dbHelper.deleteProduct(products.first.id!);

  // Retrieve all products after delete
  products = await dbHelper.getProducts();
  print(products);

  // Close the database
  dbHelper.close();
}
