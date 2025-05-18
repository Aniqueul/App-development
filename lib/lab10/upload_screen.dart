import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'post.dart';

class UploadScreen extends StatefulWidget {
  final Function(Post) onAdd;
  UploadScreen({required this.onAdd});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  File? selectedImage;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = File(picked.path));
    }
  }

  void uploadPost() {
    if (titleController.text.isEmpty || selectedImage == null) return;
    final post = Post(
      id: DateTime.now().toString(),
      title: titleController.text,
      description: descController.text,
      imagePath: selectedImage!.path,
    );
    widget.onAdd(post);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Post')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: descController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 10),
            selectedImage != null ? Image.file(selectedImage!, height: 150) : SizedBox.shrink(),
            ElevatedButton(onPressed: pickImage, child: Text('Select Image')),
            ElevatedButton(onPressed: uploadPost, child: Text('Upload')),
          ],
        ),
      ),
    );
  }
}
