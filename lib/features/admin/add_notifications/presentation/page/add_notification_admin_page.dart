import 'package:flutter/material.dart';
import 'package:nova_store/core/common/widgets/admin/admin_app_bar.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';

class AddNotificationAdminPage extends StatelessWidget {
  const AddNotificationAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: context.translate(LangKeys.notifications),
      ),
      body: const Placeholder(),
    );
  }
}
