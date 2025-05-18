import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'post.dart';

class UpdateScreen extends StatefulWidget {
  final Post post;
  final Function(Post) onUpdate;

  UpdateScreen({required this.post, required this.onUpdate});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController titleController;
  late TextEditingController descController;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.post.title);
    descController = TextEditingController(text: widget.post.description);
    selectedImage = File(widget.post.imagePath);
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = File(picked.path));
    }
  }

  void updatePost() {
    final updatedPost = Post(
      id: widget.post.id,
      title: titleController.text,
      description: descController.text,
      imagePath: selectedImage!.path,
    );
    widget.onUpdate(updatedPost);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Post')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: descController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 10),
            selectedImage != null ? Image.file(selectedImage!, height: 150) : SizedBox.shrink(),
            ElevatedButton(onPressed: pickImage, child: Text('Change Image')),
            ElevatedButton(onPressed: updatePost, child: Text('Update')),
          ],
        ),
      ),
    );
  }
}
