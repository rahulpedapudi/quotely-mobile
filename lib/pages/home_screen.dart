import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

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

                      // Main quote card with gradient
                      Container(
                        height: cardHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(backgrounds[selectedImage - 1]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            isDesktop ? 40 : (isTablet ? 35 : 30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Quote icon
                              SvgPicture.asset("/quote.svg"),

                              const SizedBox(height: 20),

                              // Main quote text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "The desire to create is one of the deepest yearnings of the human soul.",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge,
                                    ),

                                    SizedBox(
                                      height: isDesktop
                                          ? 40
                                          : (isTablet ? 35 : 30),
                                    ),

                                    // Author attribution
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "— DIETER F. UCHTDORF",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: isDesktop ? 45 : (isTablet ? 40 : 35)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(backgrounds.length, (
                              index,
                            ) {
                              bool isSelected = (selectedImage == index + 1);

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImage = index + 1;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  padding: const EdgeInsets.all(
                                    3,
                                  ), // border padding
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      backgrounds[index],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
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
