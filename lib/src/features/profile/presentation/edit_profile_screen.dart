import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/user_profile_information_controller.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile/clickable_overlay.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile/entry.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _nameTextFieldController = TextEditingController();
  final _bioTextFieldController = TextEditingController();
  File? _bannerImage;
  File? _profileImage;

  @override
  void dispose() {
    _nameTextFieldController.dispose();
    _bioTextFieldController.dispose();
    super.dispose();
  }

  // Banner Image Picker
  void _onPickBannerImage() {
    _showImageOptions(
      (image) {
        setState(() {
          _bannerImage = image;
        });
      },
    );
  }

  // Profile Image Picker
  void _onPickProfileImage() {
    _showImageOptions(
      (image) {
        setState(() {
          _profileImage = image;
        });
      },
    );
  }

  // Show Image Options
  Future<void> _showImageOptions(void Function(File image) onPickImage) async {
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
        getImage(ImageSource.camera, onPickImage);
        break;
      case "gallery":
        getImage(ImageSource.gallery, onPickImage);
        break;
      case null:
        print("dialog dismissed");
        break;
    }
  }

  void getImage(
      ImageSource source, void Function(File image) onPickImage) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (pickedImage == null) return;

    onPickImage(File(pickedImage.path));
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
            onPressed: () async {
              if (_nameTextFieldController.text.isNotEmpty) {
                await ref
                    .read(userProfileInformationControllerProvider.notifier)
                    .updateProfile(_nameTextFieldController.text,
                        _bioTextFieldController.text);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be empty"),
                  ),
                );
              }
            },
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
                    onTap: _onPickBannerImage,
                    child: SizedBox(
                      width: double.infinity,
                      height: 140,
                      child: _bannerImage == null
                          ? Image.asset(
                              appUser.bannerUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              _bannerImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
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
                          onTap: _onPickProfileImage,
                          child: _profileImage == null
                              ? Image.asset(
                                  appUser.photoUrl,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  _profileImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Name TextField
              ref.read(userProfileInformationControllerProvider).when(
                    data: (user) {
                      return Column(
                        children: [
                          Entry(
                              controller: _nameTextFieldController
                                ..text = user.fullname,
                              title: "Name",
                              maxLine: 1),
                          const SizedBox(height: 26),

                          // Bio TextField
                          Entry(
                              controller: _bioTextFieldController
                                ..text = user.description,
                              title: "Personal Information",
                              maxLine: 3),
                        ],
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Center(child: Text("Error: $error")),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
