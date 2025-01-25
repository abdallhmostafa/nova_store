import 'package:flutter/material.dart';
import 'package:nova_store/core/common/widgets/admin_app_bar.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';

class AddCategorePage extends StatelessWidget {
  const AddCategorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: context.translate(LangKeys.categories),
      ),
      body: const Placeholder(),
    );
  }
}
