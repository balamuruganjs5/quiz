import 'package:flutter/material.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: summaryData
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ((item['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                item['question'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item['correct_answer'].toString(),
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['user_answer'].toString(),
                                style: const TextStyle(color: Colors.black26),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
