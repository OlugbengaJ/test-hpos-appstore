import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/themes.dart';

class ProductTagButton extends StatelessWidget {
  const ProductTagButton({Key? key, required this.name, required this.slug})
      : super(key: key);
  final String name;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {},
        style: textBtnStyleWhite,
        child: SizedBox(
          height: 30,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
