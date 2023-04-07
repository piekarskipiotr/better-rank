import 'package:betterrank/data/enum/image_button_type.dart';
import 'package:betterrank/pages/create_rank/ui/image_button.dart';
import 'package:betterrank/widgets/text/page_title.dart';
import 'package:flutter/material.dart';

class CreateRankPage extends StatelessWidget {
  const CreateRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PageTitle(text: 'Create'),
            SizedBox(height: 24),
            ImageButton(type: ImageButtonType.cover),
          ],
        ),
      ),
    );
  }
}
