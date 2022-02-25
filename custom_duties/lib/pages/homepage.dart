// // ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespac, sized_box_for_whitespace, duplicate_ignore

// import 'package:custom_duties/Modals/modals.dart';
// import 'package:custom_duties/pages/api_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({
//     Key? key,
//     //this.item,
//   }) : super(key: key);

//   //final ApiItem? item;

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     //to be checked out for clarification
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       body: SingleChildScrollView(
//         child: 
//                 // second container
                
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // third container
//                 const SizedBox(
//                   height: 80,
//                 )
//                 Container(
//                   height: 250,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.grey[300],
//                   ),
//                   child: Column(children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Image.asset(
//                       'assets/box.jpg',
//                       height: 150,
//                       width: 150,
//                     ),
//                     //const SizedBox(height: 10,),
//                     const Text(
//                       'Write a word and search',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     //const SizedBox(height: 10,),
//                     //const Text('Ex. Shoes, home appliances.',style: TextStyle(fontSize: 20),),
//                     const Text('related word')
//                   ]),
//                 ),
//               ],
//             )),
//       ),
//       drawer: myDrawer(),
//     );
//   }
// }



// WHERE I WILL BE GETTING THE DATA FROM
// SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//             color: const Color.fromARGB(244, 244, 247, 248),
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
//             child: Column(
//               children: [
//                 // first container
//                 // ignore: sized_box_for_whitespace
//                 Container(
//                   height: 120,
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                           onTap: () {
//                             Get.to(myDrawer());
//                           },
//                           child: Icon(
//                             Icons.dehaze,
//                             size: 30,
//                             color: Colors.blue[600],
//                           )),
//                       const CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage('assets/flag.jpg'),
//                       ),
//                       IconButton(
//                         onPressed: () async {
//                           await Share.share(
//                               'https://play.google.com/store/apps/details?id=com.custom_duties');
//                         },
//                         icon: Icon(
//                           Icons.share,
//                           size: 35,
//                           color: Colors.blue[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )])),

//                 // textfield area
//                 Container(
//                   height: 65,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.grey[300],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(left: 10, top: 8),
//                         height: 65,
//                         width: MediaQuery.of(context).size.width * 0.60,
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Search',
//                             hintStyle: TextStyle(
//                               color: Colors.black38,
//                               fontSize: 22,
//                             ),
//                           ),
//                           onChanged: (value){},
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(ApiPage());
//                         },
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                               topRight: Radius.circular(15),
//                               bottomRight: Radius.circular(15)),
//                           child: Container(
//                             height: 65,
//                             width: MediaQuery.of(context).size.width * 0.25,
//                             color: Colors.blue[900],
//                             child: const Icon(
//                               Icons.search,
//                               size: 40,
//                               color: Colors.white,
//                             ),
//                           ),),),])),


//                           // second container
//                           Container(
//                 padding: const EdgeInsets.only(right: 10, left: 10),
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Obx(() {
//                   if (productController.isLoading.value)
//                     return const Center(child: CircularProgressIndicator());
//                   else
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: ListView.builder(
//                             padding: const EdgeInsets.only(top: 10),
//                             itemCount: productController.productList.length,
//                             itemBuilder: (context, index) {
//                               return ApiItem(
//                                   product: productController.productList[index]);
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                 })),


//                           // second container
//           ],
//         // ),)





                          