import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StudentProfileController extends GetxController {
  String? pickedItem;
  bool nigga = true;
  final ImagePicker picker = ImagePicker();
  File? image;

  Future<File?> pickPhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return File(photo!.path);
  }

  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return File(image!.path);
  }
}
