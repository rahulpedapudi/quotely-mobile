import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuoteCard extends StatelessWidget {
  final Map quoteInfo;
  final String background;
  final Map deviceInfo;

  const QuoteCard({
    super.key,
    required this.quoteInfo,
    required this.background,
    required this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return // Main quote card with gradient
    Container(
      height: deviceInfo['cardHeight'],
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          deviceInfo['isDesktop'] ? 40 : (deviceInfo['isTablet'] ? 35 : 30),
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
                    quoteInfo['quote'],
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  SizedBox(
                    height: deviceInfo['isDesktop']
                        ? 40
                        : (deviceInfo['isTablet'] ? 35 : 30),
                  ),
                  // Author attribution
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      quoteInfo['author'],
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
