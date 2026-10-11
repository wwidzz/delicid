import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  final String className;

  const VideoPage({
    super.key,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),

      body: Column(
        children: [
          // =====================================================
          // HEADER
          // =====================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
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
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        className,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // =================================================
                      // TEMPAT VIDEO
                      // =================================================

                      Container(
                        width: 850,
                        height: 470,
                        decoration: BoxDecoration(
                          color: const Color(0xFF493B32)
                               .withValues(alpha: 0.92),
                          borderRadius:
                              BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                 Colors.black.withValues(alpha: 0.15),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                size: 90,
                                color: Colors.white,
                              ),

                              SizedBox(height: 15),

                              Text(
                                'Video Cooking Class',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                'Video akan tersedia sesuai jadwal kelas',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Video pembelajaran akan ditampilkan di sini.',
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