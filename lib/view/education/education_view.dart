import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/education/widgets/education_info.dart';

import '../../model/education.dart';
import 'education_view_model.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    EducationViewModel controller = Provider.of<EducationViewModel>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        actions: [
          IconButton(
            // height: 10,
            onPressed: () => controller.showOptionsDialog(context),
            icon: Icon(
              Icons.settings_outlined,
              size: width / 12,
            ),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            EducationInfo(
              playerName: controller.playerName,
              field: 'Field',
              grade: 7.5,
              educationHistory: const [],
            ),
            const SizedBox(height: 20),
            // const SizedBox(
            //   height: 150,
            //   child: LogContainer(),
            // ),
            const SizedBox(height: 20),
            // Expanded(child: EducationList(education: education)),
            const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () => controller.showActionsDialog(context),
            //   child: const Text('Actions'),
            // ),
            // const LogsAndButtons(),
          ],
        ),
      ),
    );
  }
}
