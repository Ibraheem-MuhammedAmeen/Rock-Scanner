import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/details_viewmodel.dart'; // assuming this is where DetailsView lives

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<DetailsView>(context, listen: false);
    vm.fetchCurrentUser(
        "Give me detailed information about the rock ${widget.name} Structure the response into: 1. Rock type, 2. Description, 3.How it forms, 4. Color, 5. Composition, 6. Hardness, 7. Density, 8. Porosity, 9. in Constructions, 10. in monuments, 11. in sculptures and go strate to the point, dont want to see anything like star and it should be aligned properly and again go strat to the point"); // Fetch based on name or image, your choice
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DetailsView>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: vm.data == null
                  ? const CircularProgressIndicator()
                  : Text(
                      vm.data!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
