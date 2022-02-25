// ignore_for_file: curly_braces_in_flow_control_structures, sized_box_for_whitespace, avoid_unnecessary_containers, must_be_immutable, duplicate_ignore

import 'package:custom_duties/Controllers/product_controller.dart';
import 'package:custom_duties/pages/details_page.dart';
import 'package:custom_duties/widgets/container_wiget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 200, 200),
        drawer: myDrawer(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Builder(
              builder: ((context) => Padding(
                    padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                    child: Obx(() {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.dehaze,
                                    size: 45,
                                    color: Color.fromARGB(255, 6, 52, 92),
                                  )),
                              const CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage('assets/east.png'),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Share.share(
                                      'https://play.google.com/store/apps/details?id=com.custom_duties');
                                },
                                icon: const Icon(
                                  Icons.share_outlined,
                                  size: 40,
                                  color: Color.fromARGB(255, 6, 52, 92),
                                ),
                              ),
                            ],
                          ),
        
                          // SearchBar(),
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 20),
                            child: Container(
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[300],
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 4),
                                          height: 65,
                                          width: MediaQuery.of(context).size.width *
                                              0.60,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 22,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              productController
                                                  .searchProducts(value);
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomRight: Radius.circular(15)),
                                            child: Container(
                                              height: 65,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              color: Colors.blue[900],
                                              child: const Icon(
                                                Icons.search,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])),
                          ),
                          const SizedBox(height: 45,),
        
                          // if search is empty, put search logic here
                          productController.searchValue.isEmpty
                              ? const ContainerWidget()
                              : Expanded(
                                  child: Container(
                                    child: Obx(() {
                                      if (productController.isLoading.value)
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      else
                                        return Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.only(top: 10),
                                                itemCount: productController
                                                    .searchList.length,
                                                itemBuilder: (context, index) {
                                                  return ApiItem(
                                                    index: index,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                    }),
                                  ),
                                ),
                        ],
                      );
                    }),
                  )),
            ),
          ),
        ));
  }
}

class ApiItem extends StatelessWidget {
  //final Products product;
  int index;

  ApiItem({
    Key? key,
    //required this.product,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace

    return GestureDetector(
      onTap: () {
        Get.to(DetailsPage(product: productController.searchList[index]));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 1 / 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              width: MediaQuery.of(context).size.width * .05,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productController.searchList[index].cdescription,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.blue)),
                          Text(productController.searchList[index].crate,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.blue)),
                          const SizedBox(height: 16.0),
                          RichText(
                            text: TextSpan(
                              text: 'H.S Code: ',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                              children: <TextSpan>[
                                TextSpan(
                                    text: productController
                                        .searchList[index].chscode,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black54)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          RichText(
                            text: TextSpan(
                              text: 'Unit of Quantity: ',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                              children: <TextSpan>[
                                TextSpan(
                                    text: productController
                                        .searchList[index].cqty,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black54)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // RichText(
                          //   text: TextSpan(
                          //     text: 'ID: ',
                          //     style: const TextStyle(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black87),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //           text: productController.searchList[index].id
                          //               .toString(),
                          //           style: const TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15,
                          //               color: Colors.black54)),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myDrawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(235, 10, 1, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        'assets/east.png',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Custom Duties',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'v.1.0',
                      style: TextStyle(fontSize: 15, color: Colors.white30),
                    ),
                  ]),
            )),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'General',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () async {
              await Share.share(
                  'https://play.google.com/store/apps/details?id=com.custom_duties');
            },
            child: const Text(
              'Invite friends',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.black54,
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'App',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => launch(
                'https://play.google.com/store/apps/details?id=com.custom_duties'),
            child: const Text(
              'Rate App',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => launch(
                'https://play.google.com/store/apps/details?id=com.custom_duties'),
            child: const Text(
              'Leave a comment',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.black54,
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'We',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => launch(
                'https://play.google.com/store/apps/details?id=com.custom_duties'),
            child: const Text(
              'About the Developer',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => launch(
                'https://play.google.com/store/apps/details?id=com.custom_duties'),
            child: const Text(
              'About the Designer',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => launch('https://www.facebook.com/eastafricacustomduties'),
            child: const Text(
              'Gregoire',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
      ],
    ),
  );
}
