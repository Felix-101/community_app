import 'package:community_app/util/exports.dart';
import 'package:community_app/widgets/write_post_area.dart';

class CommunityFeedScreen extends StatefulWidget {
  const CommunityFeedScreen({super.key});

  @override
  State<CommunityFeedScreen> createState() => _CommunityFeedScreenState();
}

class _CommunityFeedScreenState extends State<CommunityFeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController for the Feed/Media/Events tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController
        .dispose(); // Remove the null check - _tabController is guaranteed to be initialized
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              // Background image container
              SizedBox(
                height: screenHeight * 0.35, // Adjust this height as needed
                width: double.infinity,
                child: Image.asset(
                  CommunityAppAssets.background_2,
                  fit: BoxFit.cover,
                  // The image in the example is very vibrant and appears high-quality,
                  // ensure your asset matches this style.
                ),
              ),

              // Dark overlay with strong bottom gradient for better text visibility
              Container(
                height: screenHeight * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Use a stronger gradient from a lower starting opacity
                    colors: [
                      Colors.black.withValues(alpha: 0.0),
                      Colors.black.withValues(
                        alpha: 0.8,
                      ), // Stronger dark at the bottom
                    ],
                  ),
                ),
              ),

              // Top action buttons (like the three dots menu in the top right)
              Positioned(
                top: 40, // Adjust based on your status bar height needs
                right: 16,
                child: Icon(Icons.more_vert, color: Colors.white, size: 28),
              ),

              // Content overlay - Positioned at the bottom of the Stack
              Positioned(
                bottom: 16, // Padding from the bottom edge
                left: 16, // Padding from the left edge
                right: 16, // Padding from the right edge
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Community title with verified badge
                    Row(
                      children: [
                        Text(
                          "Ekwale People",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // Ensure the font matches the visual weight of the image
                          ),
                        ),
                        const SizedBox(width: 8),
                        // The verified icon in the image is a solid blue tick
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.blue, // Verified blue color
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons
                                .check, // Using a standard checkmark icon for simplicity
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Location and type info
                    Row(
                      children: [
                        // Nigerian flag
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.asset(
                            CommunityAppAssets.flag,
                            width: 20,
                            height: 15,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Nigerian",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " • ", // Separator dot
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        // People icon (as seen in the image - a simple person silhouette)
                        SvgPicture.asset(
                          CommunityAppAssets.user,
                          width: 18,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Local",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Members section and action buttons
                    Row(
                      children: [
                        // Overlapping member images
                        OverlappingImages(),
                        const SizedBox(width: 12),
                        // Updated member count to match the image: 170 members
                        Text(
                          "170 members",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        // Action buttons
                        Row(
                          children: [
                            // Join/Add member button (Not clearly visible as 'plus',
                            // but the icon is a silhouette with a plus sign for joining/adding)
                            Container(
                              decoration: BoxDecoration(),
                              child: SvgPicture.asset(
                                CommunityAppAssets.userPlus,
                                width: 20,
                                height: 20,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Info button
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Share button
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFF5925DC),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                CommunityAppAssets.moreOptions,
                                width: 20,
                                height: 20,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Rest of the feed content would go here
          Material(
            color: Colors.white,

            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(), // remove underline
              labelColor: const Color(0xFF5925DC),
              unselectedLabelColor: Colors.grey[400],
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Feed"),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: Colors.black,
                    ),
                  ],
                ),
                const Tab(text: "Media"),
                const Tab(text: "Events"),
              ],
            ),
          ),

          // 3. Main Feed Content
          Expanded(
            child: TabBarView(
              controller: _tabController, // Remove the null assertion operator
              children: [
                // 'Feed' Tab Content
                Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE5E7EB),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const CommunityPost(),
                          const WritePostArea(),

                          // Add more posts here
                        ],
                      ),
                    ),
                  ],
                ),
                // 'Media' Tab Content
                const Center(child: Text("Media Content")),
                // 'Events' Tab Content
                const Center(child: Text("Events Content")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- NEW WIDGETS FOR THE FEED ---

class CommunityPost extends StatelessWidget {
  const CommunityPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header (Avatar, Name, Time, Options)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  CommunityAppAssets.profileImage,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Anthony",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        CommunityAppAssets.verified,
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF5925DC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Just now",
                    style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Color(0xFF6B7280)),
            ],
          ),
        ),

        // Post Text Content
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Congratulations to @Adekoya for the new whip. \nWho's available for a quick spin around the city in my Benzo!!",
            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 38, 6, 116)),
          ),
        ),

        // Post Image/Video Placeholder
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                CommunityAppAssets.postImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Video time stamp and volume icon overlay
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "0:59",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Action Buttons (Like, Comment, Share)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Like Button
              Row(
                children: [
                  SvgPicture.asset(
                    CommunityAppAssets.heart,
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF4B5563),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Like",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Comment Button
              Row(
                children: [
                  SvgPicture.asset(
                    CommunityAppAssets.comment,
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF4B5563),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Comment",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Share Button
              Row(
                children: [
                  SvgPicture.asset(
                    CommunityAppAssets.send,
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF4B5563),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Share",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Separator for next post
        const Divider(height: 1, thickness: 8, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}

class OverlappingImages extends StatelessWidget {
  OverlappingImages({super.key});

  final List<String> imagePaths = [
    CommunityAppAssets.member_1,
    CommunityAppAssets.member_2,
    CommunityAppAssets.member_3,
    CommunityAppAssets.member_4,
    CommunityAppAssets.member_5,
  ];

  @override
  Widget build(BuildContext context) {
    const double imageSize = 44.0;
    const double overlap = 18.0;

    return SizedBox(
      height: imageSize,
      width: (imageSize * 4) - (overlap * 3),
      child: Stack(
        children: imagePaths.take(4).toList().asMap().entries.map((entry) {
          int idx = entry.key;
          String imagePath = entry.value;
          return Positioned(
            left: idx * (imageSize - overlap),
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Thick white border as seen in the image
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
