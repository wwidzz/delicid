import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  final String className;

  const VideoPage({
    super.key,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),

      body: Column(
        children: [
          // =====================================================
          // HEADER
          // =====================================================

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 50,
              vertical: 18,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Text(
                  'DelicId',
                  style: TextStyle(
                    fontFamily: 'Diplomata',
                    fontSize: 28,
                    color: Color(0xFF493B32),
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF493B32),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================
          // ISI VIDEO
          // =====================================================

          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(
                    isMobile ? 16 : 40,
                  ),
                  child: Column(
                    children: [
                      // JUDUL KELAS
                      Text(
                        className,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 24 : 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF493B32),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // =================================================
                      // TEMPAT VIDEO RESPONSIF (ASPECT RATIO 16:9)
                      // =================================================

                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 850,
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF493B32)
                                  .withValues(alpha: 0.92),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 15,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_circle_outline,
                                    size: isMobile ? 60 : 90,
                                    color: Colors.white,
                                  ),

                                  const SizedBox(height: 15),

                                  Text(
                                    'Video Cooking Class',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 16 : 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      'Video akan tersedia sesuai jadwal kelas',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: isMobile ? 12 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // KETERANGAN VIDEO
                      const Text(
                        'Video pembelajaran akan ditampilkan di sini.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF79675B),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}