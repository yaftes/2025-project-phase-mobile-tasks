import 'dart:io';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddUpdatePage extends StatefulWidget {
  const AddUpdatePage({super.key});
  @override
  State<AddUpdatePage> createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  bool isUpdate = false;
  File? _image;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void addProduct(BuildContext context) async {
    ProductService.addProduct(
      name: _nameController.text,
      category: _categoryController.text,
      price: double.parse(_priceController.text),
      description: _descriptionController.text,
    );
    showSnackBar(context, 'New product added');
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product?;

    if (product != null) {
      isUpdate = true;
    }

    if (isUpdate) {
      _nameController.text = product!.name;
      _categoryController.text = product.category;
      _descriptionController.text = product.description;
      _priceController.text = product.price.toString();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: const Color.fromARGB(255, 38, 38, 231),
            size: 14,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 251, 251),
        title: Center(
          child: Text(
            isUpdate ? 'Update Product' : 'Add Product',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 236, 236),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: Icon(Icons.image_outlined, size: 40),
                            ),

                            SizedBox(height: 15),
                            Text(
                              'upload image',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )
                      : Image.file(_image!),
                ),

                SizedBox(height: 16),
                Text('name'),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 234, 234, 234),
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 10),
                Text('category'),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'category is required';
                    }
                    return null;
                  },
                  controller: _categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 234, 234, 234),
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 10),
                Text('price'),
                SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'price is required';
                    }
                    return null;
                  },
                  controller: _priceController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 234, 234, 234),
                    border: OutlineInputBorder(borderSide: BorderSide.none),

                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        '\$',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text('description'),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'description is required';
                    }
                    return null;
                  },
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 234, 234, 234),
                    border: InputBorder.none,
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Color.fromARGB(255, 38, 38, 231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isUpdate) {
                          ProductService.updateProduct(
                            name: product!.name,
                            newName: _nameController.text,
                            category: _categoryController.text,
                            price: double.parse(_priceController.text),
                            description: _descriptionController.text,
                          );
                          showSnackBar(context, 'product Updated');
                          Navigator.pop(context, true);
                        } else {
                          addProduct(context);
                        }
                      }
                    },
                    child: Text(
                      isUpdate ? 'Update' : 'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                if (isUpdate)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          side: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
