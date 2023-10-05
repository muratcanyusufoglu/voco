import 'package:flutter/material.dart';
import 'package:voco/feature/models/resources_model.dart';

class CustomResourcesCard extends StatelessWidget {
  const CustomResourcesCard({super.key, required this.data});

  final ResourcesModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(child: Image.network(data.avatar.toString())),
          title: Text('${data.firstName} ${data.lastName}'),
          subtitle: Text(data.email.toString()),
          trailing: const Icon(Icons.favorite_rounded),
        ),
      ),
    );
  }
}
