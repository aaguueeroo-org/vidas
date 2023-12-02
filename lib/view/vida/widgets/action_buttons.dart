import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/vida/vida_view_model.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    VidaViewModel controller = Provider.of<VidaViewModel>(context);

    int horizontalFlex = 10;
    int verticalFlex = 9;
    Color foregroundColor = Theme.of(context).colorScheme.onSurface;
    TextStyle? textStyle = width < 800
        ? Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
            )
        : Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
              fontSize: 40,
            );

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: verticalFlex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Education",
                    icon: Icons.menu_book_rounded,
                    textStyle: textStyle,
                    onPressed: () => controller.pushEducation(context),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Work",
                    icon: Icons.work,
                    textStyle: textStyle,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: verticalFlex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Leisure",
                    icon: Icons.chair_rounded,
                    textStyle: textStyle,
                    onPressed: () {},
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Health",
                    icon: Icons.healing,
                    textStyle: textStyle,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButtonSingle extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle? textStyle;
  // final Color foregroundColor;
  final Function onPressed;

  const ActionButtonSingle({
    Key? key,
    required this.text,
    required this.icon,
    required this.textStyle,
    // required this.foregroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(icon),
                onPressed: () => onPressed(),
                // color: foregroundColor,
              ),
            ),
          ),
          Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
