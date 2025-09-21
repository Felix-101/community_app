import 'package:community_app/util/exports.dart';

import 'package:community_app/widgets/button.dart';
import 'package:community_app/widgets/drop_down.dart';
import 'package:community_app/widgets/show_modal.dart';

import '../widgets/language_option.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(CommunityAppAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay for better text readability
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),

          // Foreground UI
          SafeArea(
            child: Column(
              children: [
                // Language Dropdown - positioned at top right
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ODropdown(
                      value: "$selectedLang (US)",
                      onTap: () {
                        handleBottomNav(
                          context,
                          ShowModalWidget(
                            headerText: "Select your preferred language",
                            bodyWidget: StatefulBuilder(
                              builder: (context, setState) {
                                return Column(
                                  children: [
                                    LanguageOption(
                                      label: "English",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      
                                      label: "Español",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      label: "Français",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      label: "German",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      label: "Chinese",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      label: "Japanese",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LanguageOption(
                                      label: "Korean",
                                      selectedValue: selectedLang,
                                      onChanged: (val) {
                                        setState(() => selectedLang = val!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // Add more languages here
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const Spacer(),

                // Title - positioned at bottom left
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 40),
                    child: Text(
                      "Connect with\nyour community\nwherever you are",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),

                // Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      OButton(
                        title: "Continue with Apple ID",
                        iconPath: CommunityAppAssets.apple,
                        color: const Color(0xFF5925DC), // Purple color from screenshot
                        textColor: Colors.white,
                        width: double.infinity,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 12),
                      OButton(
                        title: "Continue with Google",
                        iconPath: CommunityAppAssets.google,
                        color: const Color(0xFF4285F4), // Google blue
                        textColor: Colors.white,
                        width: double.infinity,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 12),
                      OButton(
                        title: "Continue with E-mail",
                        iconPath: CommunityAppAssets
                            .email, // Keep the icon as in original
                        color: Colors.transparent,
                        textColor: Colors.white,
                        width: double.infinity,
                        onPressed: () {
                          nextScreen(context, const CommunityFeedScreen());
                        },
                        borderColor: Colors.white,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Footer text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "By signing up, you accept the Terms of Use and\nPrivacy Policy of how we process your data.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
