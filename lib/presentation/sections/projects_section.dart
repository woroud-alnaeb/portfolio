import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/design/design.dart';
import '../../data/portfolio_data.dart';

// Image viewer dialog with download functionality
void _showImageViewer(BuildContext context, String imagePath, String title) {
  showDialog(
    context: context,
    barrierColor: Colors.black87,
    builder: (context) => _ImageViewerDialog(
      imagePath: imagePath,
      title: title,
    ),
  );
}

class _ImageViewerDialog extends StatelessWidget {
  final String imagePath;
  final String title;

  const _ImageViewerDialog({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Image
          Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: AppGradients.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 64,
                          color: Colors.white70,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          // Title and download button at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Download button - opens image in new tab
                  TextButton.icon(
                    onPressed: () async {
                      // Open image in new browser tab for download
                      final uri = Uri.parse(imagePath);
                      await launchUrl(uri, webOnlyWindowName: '_blank');
                    },
                    icon: const Icon(Icons.download,
                        color: AppColors.primaryCyan),
                    label: const Text(
                      'Download',
                      style: TextStyle(color: AppColors.primaryCyan),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < Breakpoints.tablet;

    final featuredProjects = projects.where((p) => p.isFeatured).toList();
    final otherProjects = projects.where((p) => !p.isFeatured).toList();

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
                title: 'Featured Projects',
                subtitle: 'Some of my best work',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Featured projects
              ...featuredProjects.map(
                (project) => Padding(
                  padding: const EdgeInsets.only(bottom: LayoutConstrains.m3),
                  child: _FeaturedProjectCard(
                    project: project,
                    isDark: isDark,
                    isMobile: isMobile,
                  ),
                ),
              ),

              const SizedBox(height: LayoutConstrains.xl1),

              // Other projects header
              const SectionTitle(
                title: 'Other Projects',
                subtitle: 'More apps I\'ve built',
              ),
              const SizedBox(height: LayoutConstrains.l1),

              // Other projects grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile
                      ? 1
                      : (screenWidth > Breakpoints.desktop ? 3 : 2),
                  mainAxisSpacing: LayoutConstrains.m2,
                  crossAxisSpacing: LayoutConstrains.m2,
                  mainAxisExtent: 280,
                ),
                itemCount: otherProjects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(
                    project: otherProjects[index],
                    isDark: isDark,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedProjectCard extends StatelessWidget {
  final Project project;
  final bool isDark;
  final bool isMobile;

  const _FeaturedProjectCard({
    required this.project,
    required this.isDark,
    required this.isMobile,
  });

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HoverGlassCard(
      padding: EdgeInsets.zero,
      child:
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Image
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () =>
                _showImageViewer(context, project.thumbnail, project.title),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(PRadius.glass),
                  bottomLeft: Radius.circular(PRadius.glass),
                ),
                child: SizedBox(
                  height: 300,
                  child: Image.asset(
                    project.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: AppGradients.primary,
                        ),
                        child: Center(
                          child: Icon(
                            _getProjectIcon(),
                            size: 64,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        // Content
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(LayoutConstrains.m3),
            child: _buildContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Image
        GestureDetector(
          onTap: () =>
              _showImageViewer(context, project.thumbnail, project.title),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(PRadius.glass),
                topRight: Radius.circular(PRadius.glass),
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset(
                  project.thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: AppGradients.primary,
                      ),
                      child: Center(
                        child: Icon(
                          _getProjectIcon(),
                          size: 48,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.all(LayoutConstrains.m3),
          child: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstrains.s3,
            vertical: LayoutConstrains.s1,
          ),
          decoration: BoxDecoration(
            color: (isDark ? AppColors.chipPurple : AppColors.primaryPurple)
                .withOpacity(0.15),
            borderRadius: BorderRadius.circular(PRadius.chip),
          ),
          child: Text(
            project.category,
            style: AppTypo.labelSmall(
              context,
            ).copyWith(
                color: isDark ? AppColors.chipPurple : AppColors.primaryPurple),
          ),
        ),
        const SizedBox(height: LayoutConstrains.s3),

        // Title
        Text(
          project.title,
          style: AppTypo.headlineSmall(
            context,
          ).copyWith(color: isDark ? AppColors.darkText : AppColors.lightText),
        ),
        Text(
          project.subtitle,
          style: AppTypo.bodyMedium(
            context,
          ).copyWith(color: AppColors.primaryCyan),
        ),
        const SizedBox(height: LayoutConstrains.s3),

        // Description
        Text(
          project.shortDescription,
          style: AppTypo.bodyMedium(context).copyWith(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: LayoutConstrains.m1),

        // Impact
        Wrap(
          spacing: LayoutConstrains.s2,
          runSpacing: LayoutConstrains.s1,
          children: project.impact
              .take(3)
              .map(
                (impact) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      impact,
                      style: AppTypo.labelSmall(context).copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(height: LayoutConstrains.m2),

        // Technologies
        Wrap(
          spacing: LayoutConstrains.s2,
          runSpacing: LayoutConstrains.s2,
          children: project.technologies
              .take(5)
              .map((tech) => SkillChip(name: tech))
              .toList(),
        ),
        const SizedBox(height: LayoutConstrains.m2),

        // Links
        Row(
          children: [
            if (project.links.containsKey('playStore'))
              _LinkButton(
                icon: FontAwesomeIcons.googlePlay,
                onTap: () => _launchUrl(project.links['playStore']),
              ),
            if (project.links.containsKey('appStore'))
              _LinkButton(
                icon: FontAwesomeIcons.appStore,
                onTap: () => _launchUrl(project.links['appStore']),
              ),
            if (project.links.containsKey('github'))
              _LinkButton(
                icon: FontAwesomeIcons.github,
                onTap: () => _launchUrl(project.links['github']),
              ),
            if (project.links.containsKey('website'))
              _LinkButton(
                icon: FontAwesomeIcons.globe,
                onTap: () => _launchUrl(project.links['website']),
              ),
            const Spacer(),
            // Status
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstrains.s3,
                vertical: LayoutConstrains.s1,
              ),
              decoration: BoxDecoration(
                color: _getStatusColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(PRadius.chip),
              ),
              child: Text(
                project.status,
                style: AppTypo.labelSmall(
                  context,
                ).copyWith(color: _getStatusColor()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _getProjectIcon() {
    switch (project.category.toLowerCase()) {
      case 'enterprise / education':
      case 'education / islamic':
        return Icons.school;
      case 'enterprise / industrial':
        return Icons.factory;
      case 'open source / sdk':
        return Icons.code;
      default:
        return Icons.phone_android;
    }
  }

  Color _getStatusColor() {
    switch (project.status.toLowerCase()) {
      case 'in production':
        return Colors.green;
      case 'in development':
        return Colors.orange;
      case 'active development':
        return Colors.blue;
      default:
        return AppColors.primaryPurple;
    }
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final bool isDark;

  const _ProjectCard({required this.project, required this.isDark});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            GestureDetector(
              onTap: () => _showImageViewer(
                  context, widget.project.thumbnail, widget.project.title),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(PRadius.glass),
                    topRight: Radius.circular(PRadius.glass),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 120,
                    width: double.infinity,
                    child: Image.asset(
                      widget.project.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: _isHovered
                                ? AppGradients.cardHover
                                : AppGradients.primary,
                          ),
                          child: Center(
                            child: Text(
                              widget.project.title[0],
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(LayoutConstrains.m1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppTypo.titleSmall(context).copyWith(
                        color: widget.isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.project.subtitle,
                      style: AppTypo.labelSmall(
                        context,
                      ).copyWith(color: AppColors.primaryCyan),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: LayoutConstrains.s2),
                    Expanded(
                      child: Text(
                        widget.project.shortDescription,
                        style: AppTypo.bodySmall(context).copyWith(
                          color: widget.isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Links row
                    Row(
                      children: [
                        ...widget.project.links.entries.take(2).map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => _launchUrl(entry.value),
                              child: Icon(
                                _getLinkIcon(entry.key),
                                size: 16,
                                color: AppColors.primaryCyan,
                              ),
                            ),
                          );
                        }),
                        const Spacer(),
                        Text(
                          widget.project.year,
                          style: AppTypo.labelSmall(context).copyWith(
                            color: widget.isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getLinkIcon(String key) {
    switch (key) {
      case 'playStore':
        return FontAwesomeIcons.googlePlay;
      case 'appStore':
        return FontAwesomeIcons.appStore;
      case 'github':
        return FontAwesomeIcons.github;
      case 'pubdev':
        return FontAwesomeIcons.box;
      default:
        return FontAwesomeIcons.globe;
    }
  }
}

class _LinkButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _LinkButton({required this.icon, required this.onTap});

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: LayoutConstrains.s3),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(LayoutConstrains.s2),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.primaryPurple.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(PRadius.button),
            ),
            child: FaIcon(
              widget.icon,
              size: 18,
              color:
                  _isHovered ? AppColors.primaryPurple : AppColors.primaryCyan,
            ),
          ),
        ),
      ),
    );
  }
}
