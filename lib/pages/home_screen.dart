import 'package:flutter/material.dart';
import 'package:quotely/models/quote.dart';
import 'package:quotely/widgets/background_switcher.dart';
import 'package:quotely/widgets/quote_card.dart';
import 'package:quotely/services/quote_service.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Quote? currentQuote;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    setState(() {
      isLoading = true;
    });

    try {
      final quote = await QuoteService.fetchQuote();
      setState(() {
        currentQuote = quote;
      });
    } catch (e) {
      debugPrint("Error Fetching $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  int selectedImage = 0;

  final List<String> backgrounds = [
    "assets/Gradient-02.jpg",
    "assets/Gradient-03.jpg",
    "assets/Gradient-04.jpg",
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
    double verticalPadding = isDesktop ? 80 : (isTablet ? 70 : 30);
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

                      Center(
                        child: isLoading
                            ? SizedBox(
                                height: 600,
                                width: double.infinity,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : currentQuote == null
                            ? QuoteCard(
                                quoteInfo: {"quote": "No Quote", "author": "-"},
                                background: backgrounds[selectedImage],
                                deviceInfo: deviceInfo,
                              )
                            : QuoteCard(
                                quoteInfo: {
                                  "quote": currentQuote?.text,
                                  "author": '— ${currentQuote?.author}',
                                },
                                background: backgrounds[selectedImage],
                                deviceInfo: deviceInfo,
                              ),
                      ),

                      SizedBox(height: isDesktop ? 45 : (isTablet ? 40 : 20)),

                      BackgroundSwitcher(
                        backgrounds: backgrounds,
                        selectedImage: selectedImage,
                        onSelected: (index) {
                          HapticFeedback.mediumImpact();
                          setState(() {
                            selectedImage = index;
                          });
                        },
                      ),

                      SizedBox(height: isDesktop ? 35 : (isTablet ? 32 : 15)),

                      Row(
                        children: [
                          // 1. Use Expanded to make the button take up available space
                          Expanded(
                            child: SizedBox(
                              // Set the height on the button's parent or directly in its style
                              height: isDesktop ? 60 : (isTablet ? 58 : 55),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  fetchQuote();
                                  HapticFeedback.mediumImpact();
                                },

                                // 2. Use ElevatedButton.icon for a cleaner button with an icon
                                icon: Icon(Icons.refresh),
                                iconAlignment: IconAlignment.end,
                                label: Text(
                                  "Another Thought",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                // 3. Style the button directly instead of wrapping it in a Container
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white, // Background color
                                  foregroundColor:
                                      Colors.black, // Color for text and icon
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),

                          // 4. Use an IconButton to make the download icon tappable
                          SizedBox(
                            height: isDesktop ? 60 : (isTablet ? 58 : 55),
                            width: isDesktop ? 60 : (isTablet ? 58 : 55),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.download,
                                color: Colors.white,
                                size: isDesktop ? 24 : (isTablet ? 22 : 20),
                              ),
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    width: 2,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                              ),
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
