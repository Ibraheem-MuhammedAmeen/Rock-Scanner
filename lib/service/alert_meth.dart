import 'package:flutter/material.dart';

import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/loading_provide.dart';

class ShowAlert {
  void showDeleteDialog(
      BuildContext context, AccountView account, LoadingProvider loading) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Heads up!"),
          content: const Text("Are you sure you want to delete your Account?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                try {
                  loading.startLoading();
                  account.deleteAccount(context);
                  account.logout(context);
                  loading.stopLoading();
                } catch (e) {
                  // optionally show an error snack
                }

                Navigator.of(context).pop(); // close after action
              },
            ),
          ],
        );
      },
    );
  }
}
