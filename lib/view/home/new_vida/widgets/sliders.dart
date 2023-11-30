import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/home/new_vida/new_vida_view_model.dart';


class Sliders extends StatelessWidget {
  const Sliders({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewVidaViewModel>(context);

    double value1 = controller.ambitiousPassive;
    double value2 = controller.extrovertedIntroverted;
    double value3 = controller.activeRelaxed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Ambitious/passive
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Passive',
                ),
                Text(
                  'Ambitious',
                ),
              ],
            ),
            Slider(
              value: value1,
              onChanged: (sliderValue) {
                controller.ambitiousPassive = sliderValue;
              },
            ),
          ],
        ),

        //Extroverted/introverted
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Introverted',
                ),
                Text(
                  'Extroverted',
                ),
              ],
            ),
            Container(
              width: 50,
              padding: EdgeInsets.zero,
              child: Slider(
                value: value2,
                onChanged: (sliderValue) {
                  controller.extrovertedIntroverted = sliderValue;
                },
              ),
            ),
          ],
        ),

        //Active/relaxed
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Relaxed',
                ),
                Text(
                  'Active',
                ),
              ],
            ),
            Slider(
              value: value3,
              onChanged: (sliderValue) {
                controller.activeRelaxed = sliderValue;
              },
            ),
          ],
        ),
      ],
    );
  }
}
