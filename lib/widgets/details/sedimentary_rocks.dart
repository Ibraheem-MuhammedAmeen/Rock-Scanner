import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../model/sedimeted_model.dart';
import '../../screens/detail_screen.dart';

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
          image:
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSVeHtirbQfXXmELOarkr1cghw-TYM0U75o09JKEQZ3WQ2iWjytK07XRqu1deUCdSNyZC-SPl3zO7E0RIS94DCeTT7EURhWWD8o41DE-Hbb',
        ),
        SedmentedRockModel(
            name: 'Sandstone',
            desc:
                'Sandstone is a clastic sedimentary rock \nmade of sand-sized grains. It often has visible layers and is commonly found in deserts.',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuF5EMQk85RVgHk_dzFjphSHQBTEftJ9S8EA&s'),
        SedmentedRockModel(
          name: 'Shale',
          desc:
              'Shale is a fine-grained sedimentary rock \nformed from mud and clay. It splits easily into thin layers.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ46jTIE-LfUStklLiIBFc-vCHRYBGSPtGaAw&s',
        ),
        SedmentedRockModel(
          name: 'Conglomerate',
          desc:
              'Conglomerate is a coarse-grained sedimentary rock \nmade of rounded gravel and pebbles cemented together.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd2db39CuR7Z5tNEzQ8QuIQopfk9_niTNYGQ&s',
        ),
        SedmentedRockModel(
          name: 'Breccia',
          desc:
              'Breccia is similar to conglomerate, \nbut made of angular, broken fragments rather than rounded ones.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSljVk2E0LxXVU8-dcCItYEcwzzBz9FPnF8Rg&s',
        ),
        SedmentedRockModel(
          name: 'Chalk',
          desc:
              'Chalk is a soft, white, porous sedimentary rock \nmade from the shells of microscopic marine organisms.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA3MkLSrsaUW4Qh6Db-YKucSi3ma112NFQYw&s',
        ),
        SedmentedRockModel(
          name: 'Coquina',
          desc:
              'Coquina is a sedimentary rock \ncomposed primarily of fragmented shells and coral, loosely cemented together.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfhdMuqmi37BXSqh95dYdF_K9e-HYiTjVkmw&s',
        ),
        SedmentedRockModel(
          name: 'Dolostone',
          desc:
              'Dolostone is a sedimentary carbonate rock \nmainly composed of the mineral dolomite, often formed by alteration of limestone.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ2LG98klOAGey9FskaJT84agce6VBrpqZdw&s',
        ),
        SedmentedRockModel(
          name: 'Diatomite',
          desc:
              'Diatomite, also known as diatomaceous \n earth, is a sedimentary rock...',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy-0h2UCm0d-pRcYDAgHvZ5KJbWbn5J8i24A&s',
        ),
        SedmentedRockModel(
          name: 'Siltstone',
          desc:
              'Siltstone is a sedimentary rock \ncomposed of silt-sized particles. It feels gritty and falls between sandstone and shale in texture.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm39SXXh6GICQR9Dtq8RHe-PhXdm0R9_bQ4g&s',
        ),
        SedmentedRockModel(
          name: 'Mudstone',
          desc:
              'Mudstone is a fine-grained sedimentary rock \nformed from a mixture of clay and silt. It does not split as easily as shale.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuV7CO2G9w24S_oAwlrOd0nYwMmYKyelSu0Q&s',
        ),
      ];

      for (final rock in sedimentaryRocks) {
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              name: rock.name, image: rock.image)));
                },
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
