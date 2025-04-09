import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/metamorphic_model.dart';

class MetamorphicRock extends StatefulWidget {
  const MetamorphicRock({super.key});

  @override
  State<MetamorphicRock> createState() => _MetamorphicRockState();
}

class _MetamorphicRockState extends State<MetamorphicRock> {
  late final Box<MetamorphicRockModel> rockBox;

  @override
  void initState() {
    super.initState();
    rockBox = Hive.box<MetamorphicRockModel>('MetamorphicRocks');
    _populateRocksIfNeeded();
  }

  void _populateRocksIfNeeded() {
    if (rockBox.isEmpty) {
      final metamorphicRocks = <MetamorphicRockModel>[
        MetamorphicRockModel(
          name: 'Slate',
          desc:
              'Slate is a fine-grained metamorphic rock \nformed from shale. It splits into thin, durable sheets and is often used for roofing.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdRsMPBOka3Y2O8Thf028dE9SEUOf055LkfmDjbjB9pATyBj-vR65RxKA&s',
        ),
        MetamorphicRockModel(
          name: 'Phyllite',
          desc:
              'Phyllite is a metamorphic rock \nwith a silky sheen and wavy layers, formed from slate under increased heat and pressure.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_xIHKqHVaHkVncj6U6MdFnKMxOAc7WUFy-TrkR76HDlR9rhlCu7RVew8&s',
        ),
        MetamorphicRockModel(
          name: 'Schist',
          desc:
              'Schist is a medium- to coarse-grained metamorphic rock \nwith pronounced layers of minerals like mica. It sparkles under light.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrgAL7zCT644RNKGctI3oaAeBftemnWfTjwfSHdZc97qe3LG9JFv-g-Q&s',
        ),
        MetamorphicRockModel(
          name: 'Gneiss',
          desc:
              'Gneiss is a high-grade metamorphic rock \nknown for its banded appearance and forms from granite or sedimentary rocks.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9SLZ-lFgm4cEGTp14ZUs-vNRtp17JEnNzKk0v7iIWDme5jlLeJ86Yvbw&s',
        ),
        MetamorphicRockModel(
          name: 'Marble',
          desc:
              'Marble is a non-foliated metamorphic rock \nformed from limestone. It’s prized for its beauty and used in sculptures and buildings.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxql8knB3oSob--rr3bQ18AFHK29tNktYBNtq94tAfQd2bmpm9Qfuu6hA&s',
        ),
        MetamorphicRockModel(
          name: 'Quartzite',
          desc:
              'Quartzite is a hard metamorphic rock \nformed from sandstone. It’s tough and resists weathering.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQIjOCo0UrqtzeJnf8DcwqtTduuNNg-qrkxWwdCE03UgKmFfYi6qUVij0&s',
        ),
        MetamorphicRockModel(
          name: 'Hornfels',
          desc:
              'Hornfels is a dense, fine-grained metamorphic rock \nformed by contact metamorphism. It doesn’t show foliation.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1ovucqR80IH_Pu12jyI3gCmVtzG75gwUssKqCjaqoaepIVB6GbP4AfM8&s',
        ),
        MetamorphicRockModel(
          name: 'Anthracite Coal',
          desc:
              'Anthracite is a metamorphic form of coal \nthat’s shiny, hard, and has the highest carbon content of all coals.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVqIJhSdR0Rk-7slXufwABvdKE3txZ3WOmbaLexQv52m_Oh_mfww90iis&s',
        ),
        MetamorphicRockModel(
          name: 'Biotite',
          desc:
              'Biotite is a black, sheet-like mineral \noften found in schists and gneisses. It’s a type of mica and splits easily.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTllvWMmbwhnHtoFlZ3IcBqmIwd7pyLdfukkXleIfgpO6C5Fo6vBcmPyNg&s',
        ),
        MetamorphicRockModel(
          name: 'Garnet',
          desc:
              'Garnet often forms in metamorphic rocks \nand appears as reddish crystals. It’s also used as a gemstone.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOy6laVVYuN5BGwO5BxQoj7qzWrBwsN1XvaViBm8JIawDPGMeWzw_nXjg&s',
        ),
        MetamorphicRockModel(
          name: 'Staurolite',
          desc:
              'Staurolite is a brown, cross-shaped crystal \nfound in metamorphic rocks like schist. It’s a symbol of good luck in some cultures.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLsMWe18MC0CnmtKxSQ5Cd6KfhTp3lRDmhx0xUptAo3r1wsb7GRaI6miw&s',
        ),
        MetamorphicRockModel(
          name: 'Kyanite',
          desc:
              'Kyanite is a blue mineral \nthat forms under high pressure in metamorphic rocks. It has long, blade-like crystals.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqOLTQq8HsTflI2CDHOpAXQDBpReXniFPtNQSw3_1OU_cPZboKk3onnvo&s',
        ),
        MetamorphicRockModel(
          name: 'Sillimanite',
          desc:
              'Sillimanite forms under high temperature \nand pressure, often found in gneiss and schist. It has fibrous or needle-like crystals.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC8WwJ8ahSZuv9IefIf6CBYNHJQLX8xa6D9OaD7RNTvvOtup0K9slRH7c&s',
        ),
      ];

      for (final rock in metamorphicRocks) {
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
