import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/education/education_view_model.dart';

import 'package:vidas/model/education.dart';

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
        (controller.vida.educations.isEmpty)
            ? const Center(
                child: Text('No educatioooot'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: controller.vida.educations.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EducationListItem(
                      education: controller.vida.educations[index],
                    );
                  },
                ),
              )
        // ListView.builder(itemBuilder: Edu),
      ],
    );
  }
}

class EducationListItem extends StatelessWidget {
  final Education education;

  const EducationListItem({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.tertiary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
        );

    final controller = Provider.of<EducationViewModel>(context);

    final String educationName =
        education.levelName == 'Preeschool' || education.levelName == 'Middle school'
            ? education.levelName
            : '${education.levelName} - ${education.field}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //icon
          Icon(
            Icons.school,
            size: 50,
            color: color,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  educationName,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle,
                ),
                Text(
                  'Grade: ${education.grade}',
                  style: textStyle,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => controller.deleteEducation(education.id),
          ),
        ],
      ),
    );
  }
}
