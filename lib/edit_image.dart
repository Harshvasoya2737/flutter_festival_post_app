import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_festival_post_app/edit_post.dart';

class Edit extends StatefulWidget {
  final Map? product;

  const Edit({Key? key, this.product}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
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
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff162135),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                ),
              ),
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(widget.product?['color']),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                    bottomRight: Radius.circular(250),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        bool exit = await ExitDialog(context);
                        if (exit == true) {
                          Navigator.pop(context);
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55, top: 100),
                child: Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    child: Image.asset(
                      widget.product!['img'],
                      height: 250,
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          Container(
            height: 80,
            width: 250,
            decoration: BoxDecoration(
                color: Color(widget.product?['color']),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(widget.product?['color']),
                    spreadRadius: 2,
                    blurRadius: 20,
                  )
                ]),
            child: Center(
                child: Text(
              widget.product?['text'],
              style: TextStyle(color: Colors.white, fontFamily: 'Pacifico',fontSize: 30),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditPost(product: {'img': widget.product!['img']}),
                ),
              );
            },
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ]),
              child: Center(
                child: Text(
                  "Edit Your Template",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 63),
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff162135),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.4),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(widget.product?['color']),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(250),
                      topRight: Radius.circular(250),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 98, top: 70),
                child: Container(
                  height: 170,
                  width: 220,
                  child: Image.asset(
                    'assets/images/tricks-removebg-preview.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
