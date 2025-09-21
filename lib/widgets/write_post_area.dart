import 'package:community_app/util/exports.dart';

class WritePostArea extends StatefulWidget {
  const WritePostArea({super.key});

  @override
  State<WritePostArea> createState() => _WritePostAreaState();
}

class _WritePostAreaState extends State<WritePostArea> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          // Profile Avatar
          ClipOval(
            child: Image.asset(
              CommunityAppAssets.profileImage,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Text Input Field
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Write something...",
                hintStyle: TextStyle(
                  color:  Color(0xFF5925DC).withValues(alpha:0.3),
                  fontSize: 16,
                ),
                prefix: Container(
                  padding: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    CommunityAppAssets.image,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFF5925DC).withValues(alpha:0.2), width: 0.1),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Post Button (Reactive to text input)
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _textController,
            builder: (context, value, child) {
              final isEmpty = value.text.trim().isEmpty;
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isEmpty
                      ? const Color.fromARGB(255, 221, 206, 251)
                      : const Color(0xFF5925DC),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  CommunityAppAssets.sender,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
