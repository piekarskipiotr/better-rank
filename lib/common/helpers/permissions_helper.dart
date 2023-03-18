import 'package:betterrank/pages/permissions_rationale/permission_rationale_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<dynamic> checkPermission({
    required BuildContext context,
    required List<Permission> permissions,
  }) async {
    for (final p in permissions) {
      final status = await p.request().then(
            (req) => _handleRequest(context, p, req),
          );

      if (status.isDenied || status.isPermanentlyDenied) {
        throw Exception('permissions-denied');
      }
    }
  }

  static PermissionStatus _handleRequest(
    BuildContext context,
    Permission perm,
    PermissionStatus req,
  ) {
    if (req.isDenied || req.isPermanentlyDenied) {
      showDialog<dynamic>(
        context: context,
        builder: (context) => PermissionRationalePage(permission: perm),
      );
    }

    return req;
  }
}
