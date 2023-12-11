import 'package:flutter/material.dart';

import '../../../../domain/entity/exercise_list_response_entity.dart';

class ExerciseListWidget extends StatelessWidget {
  const ExerciseListWidget({
    super.key,
    required this.exercise,
  });

  final ExerciseDataEntity exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF3F7F8),
            ),
            child: Image.network(
              exercise.icon,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'No Img',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          Text(
            exercise.exerciseTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${exercise.jumlahDone}/${exercise.jumlahSoal} '
            'Soal',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 8,
              color: Color(0XFF8E8E8E),
            ),
          ),
        ],
      ),
    );
  }
}
