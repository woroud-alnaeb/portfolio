import 'package:flutter/material.dart';
import '../../../common/design/design.dart';
import '../../../theme_provider.dart';

class NavBar extends StatefulWidget {
  final ThemeProvider themeProvider;
  final Function(int) onNavItemTap;

  const NavBar({
    super.key,
    required this.themeProvider,
    required this.onNavItemTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isMobileMenuOpen = false;

  static const List<String> _navItems = [
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Services',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < Breakpoints.tablet;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? LayoutConstrains.m2 : LayoutConstrains.l1,
        vertical: LayoutConstrains.m1,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.wide),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Name
              _buildLogo(isDark),

              // Navigation items (desktop) or menu button (mobile)
              if (isMobile)
                _buildMobileMenu(isDark)
              else
                _buildDesktopNav(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(bool isDark) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              borderRadius: BorderRadius.circular(PRadius.button),
            ),
            child: const Center(
              child: Text(
                'W',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: LayoutConstrains.s3),
          Text(
            'Woroud',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNav(bool isDark) {
    return Row(
      children: [
        // Nav items
        ..._navItems.asMap().entries.map((entry) {
          return _NavItem(
            text: entry.value,
            isDark: isDark,
            onTap: () => widget.onNavItemTap(entry.key),
          );
        }),
        const SizedBox(width: LayoutConstrains.m2),
        // Theme toggle
        _buildThemeToggle(isDark),
      ],
    );
  }

  Widget _buildMobileMenu(bool isDark) {
    return Row(
      children: [
        _buildThemeToggle(isDark),
        const SizedBox(width: LayoutConstrains.s2),
        IconButton(
          onPressed: () {
            setState(() => _isMobileMenuOpen = !_isMobileMenuOpen);
            _showMobileMenu(isDark);
          },
          icon: Icon(
            _isMobileMenuOpen ? Icons.close : Icons.menu,
            color: isDark ? AppColors.darkText : AppColors.lightText,
          ),
        ),
      ],
    );
  }

  void _showMobileMenu(bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(PRadius.card)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(LayoutConstrains.m3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._navItems.asMap().entries.map((entry) {
                return ListTile(
                  title: Text(
                    entry.value,
                    style: TextStyle(
                      color: isDark ? AppColors.darkText : AppColors.lightText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    widget.onNavItemTap(entry.key);
                  },
                );
              }),
            ],
          ),
        );
      },
    ).then((_) {
      setState(() => _isMobileMenuOpen = false);
    });
  }

  Widget _buildThemeToggle(bool isDark) {
    return IconButton(
      onPressed: () => widget.themeProvider.toggleTheme(),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          key: ValueKey(isDark),
          color: isDark ? AppColors.primaryCyan : AppColors.primaryPurple,
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final bool isDark;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: LayoutConstrains.m1),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _isHovered
                  ? AppColors.primaryCyan
                  : (widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}
