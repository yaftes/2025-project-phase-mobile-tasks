import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/helpers.dart';
import '../../domain/entities/product.dart';
import '../bloc/product_bloc.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  late Product _product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = ModalRoute.of(context)!.settings.arguments as Product;
    _nameController.text = _product.name;
    _descriptionController.text = _product.description;
    _priceController.text = _product.price.toString();
  }

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _editProduct(BuildContext context) {
    final name = _nameController.text.trim();
    final price = double.parse(_priceController.text.trim());
    final description = _descriptionController.text.trim();

    final updatedProduct = Product(
      id: _product.id,
      name: name,
      price: price,
      description: description,
      imageUrl: _product.imageUrl,
    );
    context.read<ProductBloc>().add(UpdateProductEvent(updatedProduct));
  }

  void _deleteProduct(BuildContext context) {
    context.read<ProductBloc>().add(DeleteProductEvent(_product.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ErrorState) {
          showSnackBar(context, state.message);
        } else if (state is LoadedAllProductState) {
          showSnackBar(context, 'Product updated successfully');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoadingState;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Edit Product'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Stack(
            children: [
              _buildForm(context),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _image == null
                    ? (_product.imageUrl.isNotEmpty
                          ? Image.network(_product.imageUrl, fit: BoxFit.cover)
                          : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image_outlined, size: 40),
                                  SizedBox(height: 10),
                                  Text(
                                    'Upload Image',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ))
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Name'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _nameController,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Name is required' : null,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAEAEA),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Price'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) return 'Price is required';
                if (double.tryParse(value) == null) {
                  return 'Enter a valid number';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAEAEA),
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.attach_money),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Description'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _descriptionController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Description is required'
                  : null,
              maxLines: 3,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAEAEA),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _editProduct(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _deleteProduct(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
