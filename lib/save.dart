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
                  if (selectedFrame != null)
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
              onPressed: () async {
                Directory add = await getApplicationDocumentsDirectory();
                String myFilePath = "${add.path}/post.png";

                File file = File(myFilePath);
                if (editedImage != null) {
                  await file.writeAsBytes(editedImage!);
                  print(file.path);
                  Share.shareXFiles(
                    [
                      XFile(file.path,),
                    ],
                  );
                }
              },
              child: Icon(Icons.share),
            ),
            Text(
              "Share",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
