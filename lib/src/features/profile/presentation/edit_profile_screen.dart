import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/banner_image.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile/clickable_overlay.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile/entry.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameTextFieldController;
  late TextEditingController _bioTextFieldController;

  @override
  void initState() {
    _nameTextFieldController = TextEditingController(text: appUser.name);
    _bioTextFieldController = TextEditingController(text: appUser.bio);
    super.initState();
  }

  @override
  void dispose() {
    _nameTextFieldController.dispose();
    _bioTextFieldController.dispose();
    super.dispose();
  }

  // Show Image Options
  Future<void> _showImageOptions() async {
    switch (await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            children: <Widget>[
              // Camera Option
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "camera");
                },
                child: const Text('Camera'),
              ),

              // Gallery Option
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "gallery");
                },
                child: const Text('Gallery'),
              ),
            ],
          );
        })) {
      case "camera":
        print("camera");
        break;
      case "gallery":
        print("gallery");
        break;
      case null:
        print("dialog dismissed");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
        ],
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, keyboardSpace + 16),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const SizedBox(height: 190),

                  // Banner Image
                  ClickableOverlay(
                    onTap: _showImageOptions,
                    child: const BannerImage(),
                  ),

                  // Profile Image
                  Positioned(
                    left: 8,
                    top: 100,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 4.0,
                        ),
                      ),
                      child: ClipOval(
                        child: ClickableOverlay(
                          onTap: _showImageOptions,
                          child: Image.asset(
                            appUser.photoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Name TextField
              Entry(
                  controller: _nameTextFieldController,
                  title: "Name",
                  maxLine: 1),
              const SizedBox(height: 26),

              // Bio TextField
              Entry(
                  controller: _bioTextFieldController,
                  title: "Personal Information",
                  maxLine: 3),
            ],
          ),
        ),
      ),
    );
  }
}
