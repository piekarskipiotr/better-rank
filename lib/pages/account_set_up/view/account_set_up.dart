import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSetUp extends StatefulWidget {
  const AccountSetUp({super.key});

  @override
  State<AccountSetUp> createState() => _AccountSetUpState();
}

class _AccountSetUpState extends State<AccountSetUp> {
  final _controller = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appBar(_controller, _currentPage),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: const [
                Center(child: Text('Page1')),
                Center(child: Text('Page2')),
                Center(child: Text('Page3')),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      3,
                      (index) => DotIndicator(
                        isActive: index == _currentPage,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: _continueButton(context, _controller, _currentPage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(PageController controller, int page) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: page != 0
            ? IconButton(
                onPressed: () => controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
                icon: const Icon(Icons.arrow_back_ios_new),
              )
            : null,
      ),
    );
  }

  Widget _continueButton(
    BuildContext context,
    PageController controller,
    int page,
  ) {
    final l10n = context.l10n;
    final isLastPage = page == 2;

    return InkWell(
      onTap: () => isLastPage
          ? {}
          : controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          isLastPage ? l10n.finish_setting_up : l10n.continue_setting_up,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
