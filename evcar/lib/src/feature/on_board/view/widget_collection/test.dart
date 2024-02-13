import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Upload to Firebase',
      home: ImageUpload(),
    );
  }
}

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  List<File> _imageList = [];
  List<String> _imageUrls = [];

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageList.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImages() async {
    for (var imageFile in _imageList) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(imageFile.path)}');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        String url = await storageReference.getDownloadURL();
        setState(() {
          _imageUrls.add(url);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload to Firebase'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _imageList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.file(_imageList[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            child: Text('Select Images'),
            onPressed: getImage,
          ),
          ElevatedButton(
            child: Text('Upload Images'),
            onPressed: uploadImages,
          ),
          SizedBox(height: 20),
          Text('Uploaded Image URLs:'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _imageUrls
                .map((url) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(url),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
