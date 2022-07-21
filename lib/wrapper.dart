import 'package:flutter/material.dart';
import 'package:hpos_appstore/sidebar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff4758F6),
        ),
        child: Row(
          children: [
            Sidebar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 16
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF2F4F7),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
                ),
                child: Center(
                  child: Text("Home"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}