import 'dart:math';

import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final int particleCount = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Initialize particles
    for (int i = 0; i < particleCount; i++) {
      _particles.add(Particle());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset? _mousePosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _mousePosition = details.localPosition;
        });
      },
      onPanEnd: (_) => setState(() => _mousePosition = null),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePosition = event.localPosition;
          });
        },
        onExit: (_) {
          setState(() {
            _mousePosition = null;
          });
        },
        child: Stack(
          children: [
            // Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: AppColors.backgroundGradient,
              ),
            ),
            // Animated Particles
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: ParticlePainter(
                    particles: _particles,
                    animation: _controller.value,
                    mousePosition: _mousePosition,
                  ),
                  size: Size.infinite,
                );
              },
            ),
            // Content
            widget.child,
          ],
        ),
      ),
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double size;
  late double speedX;
  late double speedY;
  late Color color;
  double originalX = 0;
  double originalY = 0;

  Particle() {
    init();
  }

  void init() {
    final random = Random();
    x = random.nextDouble();
    y = random.nextDouble();
    originalX = x;
    originalY = y;
    size = random.nextDouble() * 3 + 1;
    speedX = (random.nextDouble() - 0.5) * 0.0005;
    speedY = (random.nextDouble() - 0.5) * 0.0005;

    final colors = [AppColors.primary, AppColors.secondary, AppColors.accent];
    color = colors[random.nextInt(colors.length)].withOpacity(0.3);
  }

  void update(Offset? mousePos, Size size) {
    x += speedX;
    y += speedY;

    // Wrap around screen
    if (x < 0) x = 1;
    if (x > 1) x = 0;
    if (y < 0) y = 1;
    if (y > 1) y = 0;

    // Interactive Logic
    if (mousePos != null) {
      final dx = x * size.width - mousePos.dx;
      final dy = y * size.height - mousePos.dy;
      final distance = sqrt(dx * dx + dy * dy);

      if (distance < 150) {
        final force = (150 - distance) / 150;
        final angle = atan2(dy, dx);

        // Push away
        x += cos(angle) * force * 0.01;
        y += sin(angle) * force * 0.01;
      }
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animation;
  final Offset? mousePosition;

  ParticlePainter({
    required this.particles,
    required this.animation,
    this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update(mousePosition, size);

      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.size,
        paint,
      );

      // Draw connections between nearby particles
      for (var other in particles) {
        final distance = sqrt(
          pow((particle.x - other.x) * size.width, 2) +
              pow((particle.y - other.y) * size.height, 2),
        );

        if (distance < 100) {
          final linePaint = Paint()
            ..color = particle.color.withOpacity(0.1)
            ..strokeWidth = 0.5;

          canvas.drawLine(
            Offset(particle.x * size.width, particle.y * size.height),
            Offset(other.x * size.width, other.y * size.height),
            linePaint,
          );
        }
      }

      // Draw connection to mouse
      if (mousePosition != null) {
        final distanceToMouse = sqrt(
          pow((particle.x * size.width) - mousePosition!.dx, 2) +
              pow((particle.y * size.height) - mousePosition!.dy, 2),
        );

        if (distanceToMouse < 150) {
          final mouseLinePaint = Paint()
            ..color = AppColors.primary.withOpacity(0.2)
            ..strokeWidth = 1.0;

          canvas.drawLine(
            Offset(particle.x * size.width, particle.y * size.height),
            mousePosition!,
            mouseLinePaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
