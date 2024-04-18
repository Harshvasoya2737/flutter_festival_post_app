import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
class SaveScreen extends StatelessWidget {
  final Map<String, dynamic> imageData;
  final String? selectedFrame;

  const SaveScreen({Key? key, required this.imageData, this.selectedFrame})
      : super(key: key);

  Future<bool> ExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> shareImage(String imagePath, String text) async {
    try {
      await Share.shareFiles([imagePath], text: text);
    } catch (e) {
      print('Error sharing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final editedImage = imageData['editedImage'];
    final text = imageData['text'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff162135),
        title: Text(
          'Save Screen',
          style: TextStyle(color: Colors.white, fontFamily: 'Teko', fontSize: 35),
        ),
        leading: InkWell(
          onTap: () async {
            bool exit = await ExitDialog(context);
            if (exit == true) {
              Navigator.pop(context);
            }
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final directory = await getTemporaryDirectory();
              final imagePath = '${directory.path}/edited_image.png';
              final File imageFile = File(imagePath);

              await imageFile.writeAsBytes(await editedImage.readAsBytes());

              shareImage(imagePath, text);
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (editedImage != null)
              Stack(
                children: [
                  Image.asset(
                    editedImage,
                    fit: BoxFit.cover,
                    width: 220,
                    height: 220,
                  ),
                  if (selectedFrame != null) // Check if a frame is selected
                    Image.asset(
                      selectedFrame!,
                      fit: BoxFit.cover,
                      width: 220,
                      height: 220,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 155),
                    child: Text('$text'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
