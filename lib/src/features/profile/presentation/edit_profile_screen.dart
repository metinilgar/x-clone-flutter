import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';

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

  Future<void> _showImageOptions() async {
    switch (await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "camera");
                },
                child: const Text('Camera'),
              ),
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
    ;
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
                  GestureDetector(
                    onTap: () {
                      _showImageOptions();
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 140,
                          child: Image.asset(
                            appUser.bannerUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 140,
                          color: Colors.black38,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Profile Image
                  Positioned(
                    left: 8,
                    top: 100,
                    child: GestureDetector(
                      onTap: () {
                        _showImageOptions();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                        child: ClipOval(
                          child: Stack(
                            children: [
                              Image.asset(
                                appUser.photoUrl,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.black38,
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // TextFields
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameTextFieldController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Name cannot be empty',
                      ),
                    ),
                    const SizedBox(height: 26),
                    TextField(
                      controller: _bioTextFieldController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Personal Information',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
