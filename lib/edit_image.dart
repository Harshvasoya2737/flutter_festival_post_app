import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  final Map? product;

  const Edit({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff162135),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                      product!['img'],
                      height: 250,
                      fit: BoxFit.cover,
                    ) // Placeholder if no image data
                    ),
              )
            ],
          ),
          Container(
            height: 80,
            width: 250,
            decoration: BoxDecoration(
              color: Color(product?['color']),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: Text(
              product?['text'],
              style: TextStyle(color: Colors.white,fontFamily: 'HarshV'),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Edit Your Template",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Harsh',
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
                    color: Color(product?['color']),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(250),
                      topRight: Radius.circular(250),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 98,top: 70),
                child: Container(
                  height: 170,
                  width: 220,
                  child: Image.asset('assets/images/tricks-removebg-preview.png',fit: BoxFit.cover,),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
