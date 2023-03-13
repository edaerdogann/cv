import 'package:flutter/material.dart';

import '../../models/template.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final TemplateDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.template.rating),
      body: Body(template: agrs.template),
    );
  }
}

class TemplateDetailsArguments {
  final Template template;

  TemplateDetailsArguments({@required this.template});
}