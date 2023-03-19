import 'package:betterrank/config/config.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/widgets/buttons/plain_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRationalePage extends StatelessWidget {
  const PermissionRationalePage({required this.permission, super.key});

  final Permission permission;

  String _getHeaderText(AppLocalizations l10n, Permission perm) {
    if (perm == Permission.camera) {
      return l10n.camera_perm_header;
    } else if (perm == Permission.photos) {
      return l10n.photos_perm_header;
    }

    throw Exception('permission-header-not-defined');
  }

  String _getDescText(AppLocalizations l10n, Permission perm) {
    if (perm == Permission.camera) {
      return l10n.camera_perm_desc;
    } else if (perm == Permission.photos) {
      return l10n.photos_perm_desc;
    }

    throw Exception('permission-desc-not-defined');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bgColor = AppTheme.isDarkMode() ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    _getHeaderText(l10n, permission),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Opacity(
                    opacity: 0.9,
                    child: Text(
                      _getDescText(l10n, permission),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PlainButton(
                  text: l10n.open_settings,
                  onPressed: openAppSettings,
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => context.pop(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      l10n.not_now,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
