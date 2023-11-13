import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String image;
  final String name;
  final String amount;
  const CategoryContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              image,
              height: 230,
              width: 163,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(amount),
                    const SizedBox(
                      width: 15,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: const Center(
                    child: Row(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Icon(
                            Icons.manage_search_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
