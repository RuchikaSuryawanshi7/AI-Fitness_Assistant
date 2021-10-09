import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image/image.dart' as ImD;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController textController = TextEditingController();
  String url = '';
  final picker = ImagePicker();
  File? _image;
  String postId = Uuid().v4();
  bool inProcess = false;

  void selectImageFromGallery(BuildContext context) async {
    setState(() {
      inProcess = true;
    });
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _image = File(imageFile.path);
    }
    setState(() {
      inProcess = false;
    });
  }

  compressPhoto() async {
    final tDirectory = await getTemporaryDirectory();
    final path = tDirectory.path;
    ImD.Image? mImageFile = ImD.decodeImage(_image!.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(ImD.encodeJpg(mImageFile!, quality: 80));
    setState(() {
      _image = compressedImageFile;
    });
  }

  Future<String> uploadFile(File image) async {
    String downloadURL;
    Reference ref =
        usersStorageReference.child(currentUser!.id!).child("post_$postId.jpg");
    await ref.putFile(image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  @override
  void initState() {
    textController.text = currentUser != null ? currentUser!.username! : "";
    return super.initState();
  }

  void updateProfile() async {
    if (currentUser != null) {
      await compressPhoto();
      url = await uploadFile(_image!);
      usersReference.doc(currentUser!.id).update({
        'username': textController.text,
        'url': url,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF333B5E),
            size: 17,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xFF333B5E),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/images/profile.png",
                          fit: BoxFit.fill,
                        ),
                        // child: _image==null?(currentUser!=null&&(currentUser!.url)!=''?Image.asset(
                        //   'assets/images/profile.png',
                        //   fit: BoxFit.fill,
                        // ):CachedNetworkImage(imageUrl: currentUser!.url!,fit: BoxFit.cover,)):Image.file(_image!,fit: BoxFit.cover,),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 3,
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () => selectImageFromGallery(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  constraints: BoxConstraints(
                    maxWidth: 450,
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textController,
                    autocorrect: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Name',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => updateProfile(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 52,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C54E2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
