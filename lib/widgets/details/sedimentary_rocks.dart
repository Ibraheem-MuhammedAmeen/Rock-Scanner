import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../model/sedimeted_model.dart';

class SedimentaryRocks extends StatefulWidget {
  const SedimentaryRocks({super.key});

  @override
  State<SedimentaryRocks> createState() => _SedimentaryRocksState();
}

class _SedimentaryRocksState extends State<SedimentaryRocks> {
  late final Box<SedmentedRockModel> rockBox;

  @override
  void initState() {
    super.initState();
    rockBox = Hive.box<SedmentedRockModel>('rocks');
    _populateRocksIfNeeded();
  }

  void _populateRocksIfNeeded() {
    if (rockBox.isEmpty) {
      final sedimentaryRocks = <SedmentedRockModel>[
        SedmentedRockModel(
          name: 'Limestone',
          desc:
              'Limestone is a sedimentary rock \ncomposed mainly of calcium carbonate. It often forms from marine organisms like coral and shells.',
          image: 'assets/limestone.jpg',
        ),
        SedmentedRockModel(
          name: 'Sandstone',
          desc:
              'Sandstone is a clastic sedimentary rock \nmade of sand-sized grains. It often has visible layers and is commonly found in deserts.',
          image: 'assets/sandstone.jpg',
        ),
        SedmentedRockModel(
          name: 'Shale',
          desc:
              'Shale is a fine-grained sedimentary rock \nformed from mud and clay. It splits easily into thin layers.',
          image: 'assets/shale.jpg',
        ),
        SedmentedRockModel(
          name: 'Conglomerate',
          desc:
              'Conglomerate is a coarse-grained sedimentary rock \nmade of rounded gravel and pebbles cemented together.',
          image: 'assets/conglomerate.jpg',
        ),
        SedmentedRockModel(
          name: 'Breccia',
          desc:
              'Breccia is similar to conglomerate, \nbut made of angular, broken fragments rather than rounded ones.',
          image: 'assets/breccia.jpg',
        ),
        SedmentedRockModel(
          name: 'Chalk',
          desc:
              'Chalk is a soft, white, porous sedimentary rock \nmade from the shells of microscopic marine organisms.',
          image: 'assets/chalk.jpg',
        ),
        SedmentedRockModel(
          name: 'Coquina',
          desc:
              'Coquina is a sedimentary rock \ncomposed primarily of fragmented shells and coral, loosely cemented together.',
          image: 'assets/coquina.jpg',
        ),
        SedmentedRockModel(
          name: 'Dolostone',
          desc:
              'Dolostone is a sedimentary carbonate rock \nmainly composed of the mineral dolomite, often formed by alteration of limestone.',
          image: 'assets/dolostone.jpg',
        ),
        SedmentedRockModel(
          name: 'Diatomite',
          desc:
              'Diatomite, also known as diatomaceous \n earth, is a sedimentary rock...',
          image: 'assets/sandstone.jpg',
        ),
        SedmentedRockModel(
          name: 'Siltstone',
          desc:
              'Siltstone is a sedimentary rock \ncomposed of silt-sized particles. It feels gritty and falls between sandstone and shale in texture.',
          image: 'assets/siltstone.jpg',
        ),
        SedmentedRockModel(
          name: 'Mudstone',
          desc:
              'Mudstone is a fine-grained sedimentary rock \nformed from a mixture of clay and silt. It does not split as easily as shale.',
          image: 'assets/mudstone.jpg',
        ),
      ];

      for (final rock in sedimentaryRocks) {
        rockBox.add(rock);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'how far',
        )
      ],
    );
  }
}
