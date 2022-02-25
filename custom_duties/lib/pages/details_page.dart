// ignore_for_file: sized_box_for_whitespace

import 'package:custom_duties/Modals/modals.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.cdescription),
          backgroundColor: Colors.blue[900],
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HS Code description',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.cdescription,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue[900],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'MFN TARIFF ORIGINAL NOMENCLATURE',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.blue[900],
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue[900],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'H.S Code/Tariff No.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            width: 125,
                          ),
                          Expanded(
                            child: Text(
                              product.chscode,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15),
                       Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue[900],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Unit of Quantity',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            width: 125,
                          ),
                          Expanded(
                            child: Text(
                              product.cqty,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15),
                       Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue[900],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Rate',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            width: 200,
                          ),
                          Expanded(
                            child: Text(
                              product.crate,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
