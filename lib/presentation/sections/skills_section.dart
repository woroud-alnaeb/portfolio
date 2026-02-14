import 'dart:async';

import 'package:flutter/material.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < Breakpoints.tablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? LayoutConstrains.m2 : LayoutConstrains.l1,
        vertical: LayoutConstrains.xl2,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: MaxWidth.content),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Skills & Expertise',
                subtitle: 'Technologies I work with',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Category tabs
              _buildCategoryTabs(isDark, isMobile),
              const SizedBox(height: LayoutConstrains.l1),

              // Skills grid
              _buildSkillsGrid(isDark, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(bool isDark, bool isMobile) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white.withOpacity(0.05),
          ],
          stops: const [0.0, 0.8, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: LayoutConstrains.s1),
        child: Row(
          children: skillCategories.asMap().entries.map((entry) {
            final isSelected = entry.key == _selectedCategoryIndex;
            return Padding(
              padding: const EdgeInsets.only(right: LayoutConstrains.s2),
              child: _CategoryTab(
                name: entry.value.name,
                isSelected: isSelected,
                isDark: isDark,
                onTap: () => setState(() => _selectedCategoryIndex = entry.key),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDark, bool isMobile) {
    final category = skillCategories[_selectedCategoryIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GridView.builder(
        key: ValueKey(_selectedCategoryIndex),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 2,
          mainAxisSpacing: LayoutConstrains.m3,
          crossAxisSpacing: LayoutConstrains.l1,
          mainAxisExtent: 70,
        ),
        itemCount: category.skills.length,
        itemBuilder: (context, index) {
          final skill = category.skills[index];
          return SkillBar(
            name: skill.name,
            level: skill.level,
            years: skill.years,
            color: _getSkillColor(index),
          );
        },
      ),
    );
  }

  Color _getSkillColor(int index) {
    final colors = [
      AppColors.primaryPurple,
      AppColors.primaryCyan,
      AppColors.primaryPink,
      const Color(0xFF00FFB2),
      const Color(0xFFFFD93D),
    ];
    return colors[index % colors.length];
  }
}

class _CategoryTab extends StatefulWidget {
  final String name;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _CategoryTab({
    required this.name,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<_CategoryTab> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstrains.m2,
            vertical: LayoutConstrains.s3,
          ),
          decoration: BoxDecoration(
            gradient: widget.isSelected ? AppGradients.primary : null,
            color: widget.isSelected
                ? null
                : (_isHovered
                    ? AppColors.primaryPurple.withOpacity(0.1)
                    : (widget.isDark
                        ? AppColors.darkCard
                        : AppColors.lightCard)),
            borderRadius: BorderRadius.circular(PRadius.chip),
            border: Border.all(
              color: widget.isSelected
                  ? Colors.transparent
                  : (widget.isDark
                      ? AppColors.primaryPurple.withOpacity(0.3)
                      : AppColors.primaryPurple.withOpacity(0.2)),
              width: 1.5,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primaryPurple.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: widget.isSelected
                  ? Colors.white
                  : (widget.isDark ? AppColors.darkText : AppColors.lightText),
            ),
          ),
        ),
      ),
    );
  }
}