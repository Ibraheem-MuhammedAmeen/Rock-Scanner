import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rock_scanner/model/save_history.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final rockBox = Hive.box<SaveHistory>('History');

  @override
  Widget build(BuildContext context) {
    final keys = rockBox.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan History',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 19,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: keys.map<Widget>((key) {
              final rock = rockBox.get(key);

              if (rock == null) return const SizedBox();

              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipOval(
                    child: Image.memory(
                      base64Decode(rock.base64Image),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image,
                            color: Colors.white54);
                      },
                    ),
                  ),
                  title: Text(
                    rock.answer,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d/M/y h:mm a').format(rock.time),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: Colors.white60,
                    ),
                  ),
                ),
              );
            }).toList(), // ✅ convert to List<Widget>
          ),
        ),
      ),
    );
  }
}
