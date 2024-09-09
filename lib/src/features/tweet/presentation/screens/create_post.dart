import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/controller/post_list_controller.dart';
import 'package:x_clone_flutter/src/utils/providers/user_id_provider.dart';

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  late TextEditingController _textEditingController;
  final int _maxLength = 400;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topSpace = MediaQuery.of(context).size.height * 0.04;
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final state = ref.watch(postListControllerProvider);

    ref.listen<AsyncValue>(
      postListControllerProvider,
      (previous, state) {
        if (state.isRefreshing == false && state.hasError) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.error.toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK"),
                      ),
                    ],
                  ));
        } else if (state.isRefreshing == false && state.hasValue) {
          Navigator.of(context).pop();
        }
      },
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: topSpace, left: 10, right: 10, bottom: bottomSpace),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            if (_textEditingController.text.isNotEmpty) {
                              ref
                                  .read(postListControllerProvider.notifier)
                                  .createPost(ref.read(userIdProvider)!,
                                      _textEditingController.text);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Post")),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 6),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/default_avatar.png"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: (value) => setState(() {}),
                    controller: _textEditingController,
                    maxLength: _maxLength,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "What's going on? Write something here!",
                      counterText: "",
                      counter: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(_textEditingController.text.length.toString()),
                          CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            value:
                                _textEditingController.text.length / _maxLength,
                          ),
                        ],
                      ),
                      alignLabelWithHint: true,
                      border: InputBorder.none,
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
