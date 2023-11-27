// import 'package:flutter/material.dart';
// import 'package:ecommerce_flutter/models/product_model.dart';
// import 'package:ecommerce_flutter/helpers/db_helper.dart';


// class ProductListView extends StatefulWidget {
//   @override
//   _ProductListViewState createState() => _ProductListViewState();
// }

// class _ProductListViewState extends State<ProductListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: DatabaseHelper.instance.getProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<Product> products = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(products[index].title),
//                   // Add more details as needed
//                 );
//               },
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: Implement the logic to add a new product to the database
//           _navigateToAddProductScreen();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _navigateToAddProductScreen() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddProductScreen()),
//     );
//   }
// }

// class AddProductScreen extends StatefulWidget {
//   @override
//   _AddProductScreenState createState() => _AddProductScreenState();
// }

// class _AddProductScreenState extends State<AddProductScreen> {
//   // Define controllers for text fields
//   final _titleController = TextEditingController();
//   // Add controllers for other fields as needed

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Product'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             // Add more text fields for other product details
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Implement the logic to add a new product to the database
//                 _addProductToDatabase();
//               },
//               child: Text('Add Product'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addProductToDatabase() async {
//     // TODO: Implement the logic to add a new product to the database
//     // You'll need to use the DatabaseHelper to insert the new product into the database
//     // Retrieve values from controllers and create a Product object
//     Product newProduct = Product(
//       image: "", // Set the image path as needed
//       category: "Category", // Set the category as needed
//       price: 0, // Set the price as needed
//       ranking: 0, // Set the ranking as needed
//       title: _titleController.text,
//       // Set other details as needed
//       description: "",
//       calories: 0,
//       additives: "",
//       vitamins: "",
//     );

//     // Insert the new product into the database
//     await DatabaseHelper.instance.addProduct(newProduct);

//     // Navigate back to the product list view
//     Navigator.pop(context);
//   }
// }
