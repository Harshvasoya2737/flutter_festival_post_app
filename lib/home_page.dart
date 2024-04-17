import 'package:flutter/material.dart';
import 'util.dart';
import 'edit_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Image.asset(
                      'assets/images/festival-removebg-preview.png',
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      },
                      icon: Icon(Icons.list_alt),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_circle_outlined),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            isGrid ? buildGridProducts() : buildListProducts(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildGridProducts() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              buildProductContainer(product[0]),
              buildProductContainer(product[1]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              buildProductContainer(product[2]),
              buildProductContainer(product[3]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              buildProductContainer(product[4]),
              buildProductContainer(product[5]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              buildProductContainer(product[6]),
              buildProductContainer(product[7]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              buildProductContainer(product[8]),
              buildProductContainer(product[9]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListProducts() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[0]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[0])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[1]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[1])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[2]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[2])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[3]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[3])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[4]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[4])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[5]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[5])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[6]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[6])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[7]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[7])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[8]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[8])),
          SizedBox(height: 20),
          Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(product[9]['color']),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset.zero,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: _buildProduct(product[9])),
        ],
      ),
    );
  }

  Widget buildProductContainer(Map<String, dynamic> productData) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(product: productData),
                  ),
                );
              },
              child: Container(
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(productData['color']),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      offset: Offset.zero,
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(product: productData),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(productData['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 57, top: 140),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(product: productData),
                  ),
                );
              },
              child: Text(
                productData['text'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildProduct(Map<String, dynamic> products) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Edit(product: products),
            ),
          );

        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(products['img']),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Edit(product: products),
            ),
          );
        },
        child: Text(
          products['texts'],
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Edit(product: products),
            ),
          );
        },
        child: Text(
          products['title'],
          style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
          ),
        ),
      ),
      onTap: () {

      },
    );
  }
}
