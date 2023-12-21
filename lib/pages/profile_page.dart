import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yellafirstversion/components/custom_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  String? _imageUrl; // URL of the uploaded image
  XFile? _tempImageFile; // Temporary image file

  Future<void> _pickAndUploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _tempImageFile = image; // Set the temporary image file
      });
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        String filePath = 'profile_pictures/${DateTime.now().millisecondsSinceEpoch}_${image.name}';
        await storage.ref(filePath).putFile(File(image.path));
        String downloadURL = await storage.ref(filePath).getDownloadURL();

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.updateProfile(photoURL: downloadURL);
          await user.reload();
          setState(() {
            _imageUrl = downloadURL;
            _tempImageFile = null; // Clear the temporary image file
          });
        }
      } catch (e) {
        print(e); // Handle errors here
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    _imageUrl = user?.photoURL ?? _imageUrl; // Update image URL if user has one

    // Replace with your user's data source

    return CustomScaffold(
      title: 'Profile',
      body: Column(
        children: [
          Expanded(
            flex: 2, // Adjust the flex to allocate space for the profile info
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: _imageUrl != null
                        ? NetworkImage(_imageUrl!) as ImageProvider
                        : const AssetImage('lib/images/default_profile.png') as ImageProvider,        ),
                  const SizedBox(height: 20),
                  Text('Email: ${user?.email ?? "user@example.com"}'),
                  Text('Address: 123 Main St'),
                  Text('Points: 100'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickAndUploadImage,
                    child: const Text('Upload Profile Picture'),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              // Additional widgets or content here
              child: Text("User's Activities"),
            ),
          ),
        ],
      ),
    );
  }
}