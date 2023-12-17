import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/education/education_view_model.dart';
import 'package:vidas/utils/text_utils.dart';

import 'package:vidas/model/education_repo_item.dart';

class EducationEnrollDialog extends StatelessWidget {
  const EducationEnrollDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context, listen: false);

    return Dialog(
      child: SizedBox(
        height: 300,
        width: 200,
        child: FutureBuilder(
          future: controller.getCoursesToEnroll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData && snapshot.data!.isNotEmpty) {
              final List<EducationRepoItem> educations = snapshot.data!;

              return ListView.builder(
                itemCount: educations.length,
                itemBuilder: (context, index) {
                  String courseName =
                      TextUtils.getCourseNameFromEnroll(educations[index]);

                  return ListTile(
                    title: Text(courseName),
                    onTap: () {
                      controller.enroll(educations[index]);
                      Navigator.of(context).pop();
                      debugPrint('Enrolled in ${educations[index].levelName}');
                    },
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No courses available'),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context) async {
    final controller = Provider.of<EducationViewModel>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: controller,
        child: const EducationEnrollDialog(),
      ),
    );
  }
}
