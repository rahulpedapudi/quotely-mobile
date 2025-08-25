import 'package:flutter/material.dart';
import 'package:quotely/widgets/background_switcher.dart';
import 'package:quotely/widgets/quote_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedImage = 1;

  final List<String> backgrounds = [
    "Gradient-02.jpg",
    "Gradient-03.jpg",
    "Gradient-04.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    // Responsive breakpoints
    bool isDesktop = deviceWidth > 1024;
    bool isTablet = deviceWidth > 768 && deviceWidth <= 1024;
    bool isMobile = deviceWidth <= 768;

    // Responsive padding and sizing
    double horizontalPadding = isDesktop ? 60 : (isTablet ? 40 : 30);
    double verticalPadding = isDesktop ? 80 : (isTablet ? 70 : 60);
    double maxContentWidth = isDesktop ? 800 : double.infinity;
    double cardHeight = isDesktop ? 500 : (isTablet ? 480 : 460);

    final Map deviceInfo = {
      "isDesktop": isDesktop,
      "isTablet": isTablet,
      "isMobile": isMobile,
      "cardHeight": cardHeight,
    };

    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surface, // Dark gray background
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: SingleChildScrollView(
              child: Container(
                width: deviceWidth > maxContentWidth
                    ? maxContentWidth
                    : deviceWidth,
                constraints: BoxConstraints(
                  minHeight:
                      deviceHeight -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    verticalPadding,
                    horizontalPadding,
                    verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header text
                      SizedBox(
                        width: isMobile ? 200 : double.infinity,
                        child: Text(
                          "A moment of clarity...",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),

                      SizedBox(height: isDesktop ? 45 : (isTablet ? 40 : 35)),

                      QuoteCard(
                        quoteInfo: {
                          "quote":
                              "The desire to create is one of the deepest yearnings of the human soul.",
                          "author": "— DIETER F. UCHTDORF",
                        },
                        background: backgrounds[selectedImage],
                        deviceInfo: deviceInfo,
                      ),

                      SizedBox(height: isDesktop ? 45 : (isTablet ? 40 : 35)),

                      BackgroundSwitcher(
                        backgrounds: backgrounds,
                        selectedImage: selectedImage,
                        onSelected: (index) {
                          setState(() {
                            selectedImage = index;
                          });
                        },
                      ),

                      SizedBox(height: isDesktop ? 35 : (isTablet ? 32 : 30)),

                      // Bottom buttons
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: isDesktop ? 60 : (isTablet ? 58 : 55),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Row(
                                  spacing: 5,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      "Another Thought",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium,
                                    ),
                                    Icon(
                                      Icons.refresh,
                                      color: Colors.black,
                                      weight: 400,
                                      size: isDesktop
                                          ? 24
                                          : (isTablet ? 22 : 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Container(
                            height: isDesktop ? 60 : (isTablet ? 58 : 55),
                            width: isDesktop ? 60 : (isTablet ? 58 : 55),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            child: Icon(
                              Icons.download,
                              color: Colors.white,
                              size: isDesktop ? 24 : (isTablet ? 22 : 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
