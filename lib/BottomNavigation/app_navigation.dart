import 'package:flutter/material.dart';
import 'package:opus_banking/BottomNavigation/Account/account.dart';
import 'package:opus_banking/BottomNavigation/Banking/home.dart';
import 'package:opus_banking/BottomNavigation/Transactions/transactions.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    Transactions(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/footer icons/ic_banking.png')),
        activeIcon:
        ImageIcon(AssetImage('assets/footer icons/ic_banking_act.png')),
        label: locale.banking,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage('assets/footer icons/ic_transaction.png'),
        ),
        activeIcon:
        ImageIcon(AssetImage('assets/footer icons/ic_transaction_act.png')),
        label: locale.transactions,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage('assets/footer icons/ic_accounts.png'),
        ),
        activeIcon:
        ImageIcon(AssetImage('assets/footer icons/ic_accounts_act.png')),
        label: locale.account,
      ),
    ];
    return Scaffold(
      backgroundColor: blackColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        elevation: 15,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
