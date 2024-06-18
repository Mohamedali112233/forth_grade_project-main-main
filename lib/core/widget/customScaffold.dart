
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold(
      {super.key,
      this.back = true,
      this.onTap,
      required this.widgetList,
      required this.imageName,
      this.inNavigatorButton = true,
      this.showBack = false});
  final List<Widget> widgetList;
  final String imageName;
  final bool showBack;
  final bool back;
  bool inNavigatorButton;

  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
                height: screenHeight * .4,
                width: screenWidth,
                child: Image(
                  image: AssetImage(imageName),
                )),
            Positioned(
              bottom: 0,
              height: screenHeight * (inNavigatorButton ? .675 : .75),
              width: screenWidth,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widgetList,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * .03, right: screenWidth * .02,
              child: showBack
                  ? IconButton(
                      icon: Icon(
                        Icons.close_sharp,
                        color: Colors.black,
                        size: screenWidth * .1,
                      ),
                      color: Colors.black,
                      onPressed: back
                          ? () {
                              Get.back();
                            }
                          : onTap,
                    )
                  : const SizedBox(), // Use SizedBox as a placeholder if showBack is false
            ),
          ],
        ),
      ),
    );
  }
}
