import 'package:community_app/util/exports.dart';

class OButton extends StatelessWidget {
  final String title;
  final String? iconPath; // optional svg path
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double width;
  final double? height;
  final double? radius;
  final VoidCallback onPressed;

  const OButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textColor,
    required this.width,
    this.radius,
    this.height,
    this.iconPath,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        minimumSize: Size(width, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 21.0),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath!,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                textColor ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}