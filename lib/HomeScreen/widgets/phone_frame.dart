import 'package:flutter/material.dart';

class PhoneFrame extends StatelessWidget {
  final Widget child;

  const PhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bezelColor = isDark ? const Color(0xFF1E222B) : const Color(0xFFE2E8F0);
    final borderColor = isDark ? const Color(0xFF333B4A) : const Color(0xFFCBD5E1);

    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: 390,
        height: 800,
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: bezelColor,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: borderColor, width: 8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 40,
              offset: const Offset(0, 16),
            ),
            BoxShadow(
              color: const Color(0xFF26C8AC).withValues(alpha: isDark ? 0.2 : 0.1),
              blurRadius: 60,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: [
              // The running calculator app
              Positioned.fill(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    padding: const EdgeInsets.only(top: 44, bottom: 20),
                    viewPadding: const EdgeInsets.only(top: 44, bottom: 20),
                  ),
                  child: child,
                ),
              ),

              // Dynamic Island / Camera Notch
              IgnorePointer(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 100,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.08),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: const Color(0xFF101726),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF1E293B),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Home Indicator Bar
              IgnorePointer(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    width: 120,
                    height: 4,
                    decoration: BoxDecoration(
                      color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
