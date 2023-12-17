import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/education/education_view_model.dart';


import 'package:vidas/view/education/list_of_titles/education_list_item.dart';

class EducationList extends StatelessWidget {
  const EducationList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge!;

    final controller = Provider.of<EducationViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Titles:',
          style: titleStyle,
        ),
        (controller.educations.isEmpty)
            ? const Center(
                child: Text('No educatioooot'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: controller.educations.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EducationListItem(
                      education: controller.educations[index],
                    );
                  },
                ),
              )
        // ListView.builder(itemBuilder: Edu),
      ],
    );
  }
}




