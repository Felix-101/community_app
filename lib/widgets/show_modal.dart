import 'package:community_app/util/exports.dart';

class ShowModalWidget extends StatelessWidget {
  const ShowModalWidget({required this.bodyWidget, this.headerText, super.key});

  final Widget bodyWidget;
  final String? headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.sp,
          right: 15.sp,
          top: 15.sp,
          bottom: 50.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headerText ?? '',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2C0A84),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        CommunityAppAssets.x,
                        height: 20.sp,
                        width: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),

              //************* BODY WIDGET ***************/
              bodyWidget,
            ],
          ),
        ),
      ),
    );
  }
}
