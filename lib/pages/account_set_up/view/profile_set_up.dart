import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_avatar_cubit.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_cubit.dart';
import 'package:betterrank/pages/account_set_up/view/profile_avatar_page.dart';
import 'package:betterrank/pages/account_set_up/view/profile_name_page.dart';
import 'package:betterrank/widgets/buttons/back_icon_button.dart';
import 'package:betterrank/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetUp extends StatefulWidget {
  const ProfileSetUp({super.key});

  @override
  State<ProfileSetUp> createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  final _controller = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(_controller, _currentPage),
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  BlocProvider.value(
                    value: getIt<ProfileNameCubit>(),
                    child: const ProfileNamePage(),
                  ),
                  BlocProvider.value(
                    value: getIt<ProfileAvatarCubit>(),
                    child: const ProfileAvatarPage(),
                  ),
                  const Center(child: Text('Page3')),
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
            ? BackIconButton(
                onPressed: () => controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
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
