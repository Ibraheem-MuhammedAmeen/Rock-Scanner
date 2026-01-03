import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/screens/history.dart';
import 'package:rock_scanner/service/alert_meth.dart';

import 'package:rock_scanner/theme/const.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';
import 'package:rock_scanner/viewmodels/account_viewmodel.dart';
import 'package:rock_scanner/widgets/actions_widget.dart';

import '../viewmodels/loading_provide.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AccountView>(context, listen: false).fetchCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoadingProvider>(context, listen: false);
    final account = Provider.of<AccountView>(context, listen: false);
    final accountVM = Provider.of<AccountView>(context);
    var _showAlert = ShowAlert();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'Account',
            style: fontFam,
          ),
          actions: [
            IconButton(
              onPressed: () => accountVM.logout(context),
              icon: const Icon(Ionicons.log_out_outline),
              color: Colors.red,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.IconBackground,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        accountVM.userEmail ?? "No user logged in",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ActionsWidget(
                onTap: () {},
                text: 'Upgrade to pro',
                icon: CupertinoIcons.arrow_up_circle,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                ),
              ),
              const SizedBox(height: 20),
              ActionsWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => History(),
                    ),
                  );
                },
                text: 'Rock history',
                icon: Icons.chrome_reader_mode_outlined,
              ),
              SizedBox(height: 20),
              ActionsWidget(
                onTap: () {},
                text: 'Help & Feedback',
                icon: Ionicons.chatbubble_ellipses_outline,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.4,
                ),
              ),
              const SizedBox(height: 20),
              ActionsWidget(
                onTap: () {},
                text: 'Terms & Conditions',
                icon: Ionicons.calendar_outline,
              ),
              const SizedBox(height: 20),
              ActionsWidget(
                onTap: () {
                  _showAlert.showDeleteDialog(context, account, loading);
                },
                text: 'Delete Account',
                icon: CupertinoIcons.trash,
              ),
            ],
          ),
        ));
  }
}
