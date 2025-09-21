import 'package:community_app/util/exports.dart';

class LanguageOption extends StatelessWidget {
  final String label;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const LanguageOption({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      value: label,
      groupValue: selectedValue,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        label,
        style:  TextStyle(
          color: Color.fromARGB(255, 79, 24, 219).withValues(alpha:0.5),
          fontSize: 16,
        ),
      ),
      activeColor: const Color(0xFF2C0A84),
    );
  }
}
