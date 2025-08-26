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
    return Container(
      padding: EdgeInsets.all(
        deviceInfo['isDesktop'] ? 40 : (deviceInfo['isTablet'] ? 35 : 30),
      ),
      constraints: BoxConstraints(
        minHeight: deviceInfo['cardHeight'],
        maxHeight: 600,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
      ),

      // It creates the space around all the content.
      child:
          // The Stack operates completely WITHIN the padded area.
          Stack(
            children: [
              // Aligns to the top-left of the padded space
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset("assets/quote.svg"),
              ),

              // Aligns to the center-left of the padded space
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Center(
                  child: Align(
                    alignment: const Alignment(
                      -0.1,
                      0,
                    ), // Slightly left of center
                    child: Text(
                      quoteInfo['quote'],
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),

              // Aligns to the bottom-left of the padded space
              Positioned(
                bottom: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    quoteInfo['author'],
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
