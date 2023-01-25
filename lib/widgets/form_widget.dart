import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/utls/color.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final ValueChanged onChangedTitle;
  final VoidCallback onSaved;
   FormWidget({
    this.title = '',
    required this.onChangedTitle,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(key: homeProvider.formKey, child: buildTitle()),
          const SizedBox(
            height: 20,
          ),
          buildButton(context, homeProvider),
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title == null) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildButton(context, HomeProvider homeProvider) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          onSaved();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  colors: [CustomColor.darkPurple, CustomColor.lightPurple])),
          child: const Center(
              child: Text(
            'Save',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
