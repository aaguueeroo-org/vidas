import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/model/genders.dart';
import 'package:vidas/view/home/new_vida/new_vida_view_model.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewVidaViewModel>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<Genders>(
        value: controller.selectedGender,
        dropdownColor:
        Theme.of(context).colorScheme.primaryContainer,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        isDense: true,
        borderRadius: BorderRadius.circular(10),
        elevation: 0,
        alignment: Alignment.centerRight,
        isExpanded: true,
        items: Genders.values.map((gender) {
          return DropdownMenuItem<Genders>(
            value: gender,
            child: Text(gender.toString()), // Display the gender as text
          );
        }).toList(),
        onChanged: (Genders? value) {
          controller.selectedGender = value!;
        },
      ),
    );
  }
}
