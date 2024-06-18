import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:get/get.dart';
import '../constant.dart';

class CustomDataViewBoxController extends GetxController {
  dynamic content;
  void updateContent(String newContent) {
    content.value = newContent;
    update();
  }
}

class CustomDataViewBox extends StatelessWidget {
  CustomDataViewBox({
    super.key,
    this.content,
    required this.label,
    this.canModify = false,
    required this.function,
  });
  String label;
  String? content;
  bool canModify;
  final Function function;
  @override
  Widget build(BuildContext context) {
    CustomDataViewBoxController controller =
        Get.put(CustomDataViewBoxController());
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return GetBuilder<CustomDataViewBoxController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * .04,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenWidth * .01),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * .04),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          content == null ? 'Add $label' : content!,
                          style: TextStyle(
                            fontSize: screenWidth * .045,
                            color: Colors.grey,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * .06,
                      ),
                      //const Spacer(),
                    ],
                  ),
                ),
                if (canModify)
                  Positioned(
                    top: 1,
                    right: 0,
                    child: SizedBox(
                      //height: screenHeight * .02,
                      //width: screenWidth * .04,
                      child: IconButton(
                        color: Colors.black,
                        //alignment: Alignment.centerRight,
                        onPressed: () {
                          if (controller.content != null) {
                            share.share.setString('newValue', controller.content!);
                          }
                          Get.defaultDialog(
                            backgroundColor: kMainColor,
                            title: 'Change $label',
                            content: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    content = value;
                                    share.share.setString(
                                        'newValue', content!);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Enter new value',
                                  ),
                                  controller: TextEditingController(
                                      text: content),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    function();
                                    controller.update();
                                    Get.back();
                                    print(share.share.getString('newValue'));
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: SizedBox(
                          height: screenHeight * .02,
                          child: const Icon(Icons.mode_edit_outlined),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
