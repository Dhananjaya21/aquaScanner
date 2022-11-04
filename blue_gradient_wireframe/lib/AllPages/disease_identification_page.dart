import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseIdentificationPage extends StatefulWidget {
  const DiseaseIdentificationPage({Key? key}) : super(key: key);

  @override
  _DiseaseIdentificationPageState createState() => _DiseaseIdentificationPageState();
}

class _DiseaseIdentificationPageState extends State<DiseaseIdentificationPage> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("lib/img/3443996.jpg"),fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 200.0,
                height: 200.0,
                child: ElevatedButton(
                  
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            title: const Text('Please choose media to select'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    //if user click this button, user can upload image from gallery
                                    onPressed: () {
                                      Navigator.pop(context);
                                      getImage(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    //if user click this button. user can upload image from camera
                                    onPressed: () {
                                      Navigator.pop(context);
                                      getImage(ImageSource.camera);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.camera),
                                        Text('From Camera'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text('Upload Photo'),
                ),
            ),
            const SizedBox(
              height: 10,
            ),
            //if image not null show the image
            //if image null show text
            image != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  //to show image, you type like this.
                  File(image!.path),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
              ),
            )
                : const Text(
              "No Image",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
