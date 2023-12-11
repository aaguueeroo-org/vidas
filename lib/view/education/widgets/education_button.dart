import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/view/education/education_view_model.dart';

import 'package:vidas/model/education.dart';
import 'package:vidas/utils/text_utils.dart';

class EducationButton extends StatelessWidget {
  const EducationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context);

    final String buttonText =
        controller.isCurrentlyEnrolled(context) ? 'Actions' : 'Enroll';

    return ElevatedButton(
      onPressed: () => EnrollDialog.show(context),
      child: Text(buttonText),
    );
  }
}

class EnrollDialog extends StatelessWidget {
  const EnrollDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context, listen: false);
    final Vida vida = GetIt.instance.get<Vida>();

    return Dialog(
      child: SizedBox(
        height: 300,
        width: 200,
        child: FutureBuilder(
          future: controller.getCoursesToEnroll(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Education> educations = snapshot.data!;

              return ListView.builder(
                itemCount: educations.length,
                itemBuilder: (context, index) {
                  String courseName =
                      TextUtils.getCourseName(educations[index]);

                  return ListTile(
                    title: Text(courseName),
                    onTap: () {
                      controller.enroll(educations[index], vida);
                      Navigator.of(context).pop();
                      debugPrint('Enrolled in ${educations[index].field}');
                    },
                  );
                },
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
        child: const EnrollDialog(),
      ),
    );
  }
}
