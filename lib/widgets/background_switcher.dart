import 'package:flutter/material.dart';

class BackgroundSwitcher extends StatelessWidget {
  final List backgrounds;
  final int selectedImage;
  final ValueChanged<int> onSelected;

  const BackgroundSwitcher({
    super.key,
    required this.backgrounds,
    required this.selectedImage,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(backgrounds.length, (index) {
            final isSelected = index == selectedImage;

            return GestureDetector(
              onTap: () {
                onSelected(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(3), // border padding
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(backgrounds[index]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
