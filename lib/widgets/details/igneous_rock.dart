import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/igneous_model.dart';
import '../../screens/detail_screen.dart';

class IgneousRock extends StatefulWidget {
  const IgneousRock({super.key});

  @override
  State<IgneousRock> createState() => _IgneousRockState();
}

class _IgneousRockState extends State<IgneousRock> {
  late final Box<IgneousRockModel> rockBox;

  @override
  void initState() {
    super.initState();
    rockBox = Hive.box<IgneousRockModel>('IgneousRocks');
    _populateRocksIfNeeded();
  }

  void _populateRocksIfNeeded() {
    if (rockBox.isEmpty) {
      final igneousRocks = <IgneousRockModel>[
        IgneousRockModel(
          name: 'Granite',
          desc:
              'Granite is a coarse-grained intrusive igneous rock.\nIt’s used in buildings and monuments for its durability.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSkBneftF74PWIra_c8TG3a220XQ-Vmt47ptwU2AU501cXkm3OgQDS19Y&s',
        ),
        IgneousRockModel(
          name: 'Diorite',
          desc:
              'Diorite is an intrusive rock with a salt-and-pepper look.\nIt’s prized for its strength and bold texture.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6Yynn3xQxaSZZshtEMEMzYXF5Y_-0TgJ_T9r_RPTTT4MFut3uaSIDwXg&s',
        ),
        IgneousRockModel(
          name: 'Gabbro',
          desc:
              'Gabbro is a dense, dark-colored intrusive rock.\nIt forms deep underground and is rich in iron.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReCDrFKccPk6EYfrDus2KzMNZyrr4DLgXXNHtZ4AXUf3rEtirnpBuMRcE&s',
        ),
        IgneousRockModel(
          name: 'Pegmatite',
          desc:
              'Pegmatite is a coarse-grained rock with giant crystals.\nIt forms in the final stages of magma cooling.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3xj1McErI_3ESUJ7zk-IAWis0pA_WU10f3hb-tMmC7a3Fulv_nJghLgE&s',
        ),
        IgneousRockModel(
          name: 'Basalt',
          desc:
              'Basalt is a fine-grained volcanic rock.\nIt forms from lava flows and makes up ocean floors.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXLwQJy3PuM3_l1qx9zEiBfDsY_7kQeP2oy9x-cTIz_flK7C9e6xkol08&s',
        ),
        IgneousRockModel(
          name: 'Andesite',
          desc:
              'Andesite is an intermediate volcanic rock.\nIt’s common in volcanic arcs and mountain chains.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSn8Flgx9E-rFMVgEhnD2o8qGfNWcb3J6pYSHjyo2NLJL2H_w9xVcfE24&s',
        ),
        IgneousRockModel(
          name: 'Rhyolite',
          desc:
              'Rhyolite is a light-colored volcanic rock.\nIt forms from lava rich in silica and cools quickly.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDw6DIK5HPGhCAYiuPhRi-NnTSC4FbHNZ350SP3Z4vDgdGKIrG_Kg4RDc&s',
        ),
        IgneousRockModel(
          name: 'Obsidian',
          desc:
              'Obsidian is volcanic glass, black and sharp.\nIt forms when lava cools instantly without crystals.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7XDF82lPc7cDTsfKFqRH42Chczexv-4NUZyfXxtcAKz0n4UBQMkfLIY0&s',
        ),
        IgneousRockModel(
          name: 'Pumice',
          desc:
              'Pumice is light and filled with bubbles.\nIt forms from frothy lava and can even float on water.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTrcvYskBqE7Il3ZYaaMsmVGX2UWZtELe2huqGLDfrcbywajoFlO-jIHc&s',
        ),
        IgneousRockModel(
          name: 'Scoria',
          desc:
              'Scoria is a vesicular volcanic rock.\nIt’s dark, heavy, and often used in landscaping.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKKVbO1ZeJgNAG0kH0pyQFY2FsMcB7fqozfIOeW9D1vXpp0ltpYzv03Ik&s',
        ),
      ];

      for (final rock in igneousRocks) {
        rockBox.add(rock);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final keys = rockBox.keys.toList();

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: keys.map((key) {
              final rock = rockBox.get(key);

              if (rock == null) return const SizedBox();

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              name: rock.name, image: rock.image)));
                },
                splashColor: Colors.grey,
                child: Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipOval(
                      child: Image.network(
                        rock.image,
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
                      rock.name,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      rock.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
