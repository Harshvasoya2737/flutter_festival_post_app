import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_festival_post_app/util.dart';

class EditPost extends StatefulWidget {
  final Map? product;

  const EditPost({Key? key, this.product}) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  bool isAddingText = false;
  bool isMovingContainerVisible = false;
  bool isAddingTexts = false;
  bool isMoving = false;
  double textPosX = 150;
  double textPosY = 150;
  double titlePosX = 150;
  double titlePosY = 250;
  double fontSize = 16.0;
  String selectedFontFamily = fontStyle[0];
  Color? textColor;
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
  }// Dynamic text color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Your Image",
          style: TextStyle(color: Colors.white, fontFamily: 'Teko', fontSize: 35),
        ),
        backgroundColor: Color(0xff162135),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2, top: 10),
                  child: Image.asset(
                    widget.product!['img'],
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isAddingText || isMovingContainerVisible)
                  Positioned(
                    top: textPosY,
                    left: textPosX,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          textPosX += details.delta.dx;
                          textPosY += details.delta.dy;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: textController,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor ?? Colors.black,
                              fontSize: fontSize,
                              fontFamily: selectedFontFamily,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your text',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if(isAddingTexts || isMoving)
                  Positioned(
                    top: titlePosY,
                    left: titlePosX,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          titlePosX += details.delta.dx;
                          titlePosY += details.delta.dy;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: titleController,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor ?? Colors.black,
                              fontSize: fontSize,
                              fontFamily: selectedFontFamily,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your title',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 15),
            Stack(
              children: [
                Container(
                  height: 434,
                  width: double.infinity,
                  color: Color(0xff162135),
                ),
                Row(
                  children: [
                    Text(
                      "\t\tEdit Your Image & Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Teko',
                      ),
                    ),
                    SizedBox(width: 150),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      child: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isAddingText = !isAddingText;
                            isMovingContainerVisible = isAddingText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xff162135),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Add Text",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isAddingTexts = !isAddingTexts;
                            isMoving = isAddingTexts;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xff162135),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Add Title",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110, left: 20),
                  child: Text(
                    "Font Size",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Slider(
                    value: fontSize,
                    min: 12.0,
                    max: 50.0,
                    onChanged: (newValue) {
                      setState(() {
                        fontSize = newValue;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180, left: 20),
                  child: Text(
                    "Font Family",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220, left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: fontStyle.map((e) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedFontFamily = e;
                            });
                          },
                          child: Text(
                            e,
                            style: TextStyle(fontFamily: e, fontSize: 25),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 270, left: 20),
                  child: Text(
                    "Font Color",
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'BebasNeue'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 305, left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ColorOption(Colors.red),
                        ColorOption(Colors.green),
                        ColorOption(Colors.blue),
                        ColorOption(Colors.cyan),
                        ColorOption(Colors.brown),
                        ColorOption(Colors.black),
                        ColorOption(Colors.white70),
                        ColorOption(Colors.purpleAccent),
                        ColorOption(Colors.pinkAccent),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ColorOption(Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          textColor = color;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
