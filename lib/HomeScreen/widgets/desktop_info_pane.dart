import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopInfoPane extends StatelessWidget {
  const DesktopInfoPane({super.key});

  Future<void> _launchGitHub() async {
    final uri = Uri.parse('https://github.com/RanjanKiran707/calculator-cool-UI');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
    const accentColor = Color(0xFF26C8AC);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: accentColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(
                    child: Text(
                      'Flutter 3 • Interactive Desktop Web Edition',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Project Title
            Text(
              'Calculator Cool UI',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: primaryTextColor,
                letterSpacing: -1.2,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 28),

            // Actions (GitHub button)
            ElevatedButton.icon(
              onPressed: _launchGitHub,
              icon: const Icon(Icons.code, size: 20),
              label: const Text(
                'View Source on GitHub',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF26C8AC) : const Color(0xFF0F172A),
                foregroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
