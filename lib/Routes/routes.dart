import 'package:flutter/material.dart';
import 'package:opus_banking/BottomNavigation/Account/account.dart';
import 'package:opus_banking/BottomNavigation/Account/change_language_page.dart';
import 'package:opus_banking/BottomNavigation/Account/faqs.dart';
import 'package:opus_banking/BottomNavigation/Account/nearby_banks.dart';
import 'package:opus_banking/BottomNavigation/Account/profile.dart';
import 'package:opus_banking/BottomNavigation/Account/support.dart';
import 'package:opus_banking/BottomNavigation/Account/tnc.dart';
import 'package:opus_banking/BottomNavigation/Banking/Deposit/deposits.dart';
import 'package:opus_banking/BottomNavigation/Banking/Deposit/make_deposit.dart';
import 'package:opus_banking/BottomNavigation/Banking/FundTransfer/add_beneficiary.dart';
import 'package:opus_banking/BottomNavigation/Banking/FundTransfer/imps_quick_transfer_mode.dart';
import 'package:opus_banking/BottomNavigation/Banking/FundTransfer/transferred_successfully.dart';
import 'package:opus_banking/BottomNavigation/Banking/FundTransfer/within_bank.dart';
import 'package:opus_banking/BottomNavigation/Banking/Loans/loan_statement.dart';
import 'package:opus_banking/BottomNavigation/Banking/Loans/loans.dart';
import 'package:opus_banking/BottomNavigation/Banking/Loans/travel_loan.dart';
import 'package:opus_banking/BottomNavigation/Banking/home.dart';
import 'package:opus_banking/BottomNavigation/Transactions/transactions.dart';
import 'package:opus_banking/BottomNavigation/app_navigation.dart';
import 'package:opus_banking/Pages/add_thumb_impression.dart';
import '../BottomNavigation/Banking/FundTransfer/fund_transfer.dart';

class PageRoutes {
  static const String addThumbImpression = 'recent_orders_page';
  static const String homePage = 'home_page';
  static const String appNavigation = 'app_navigation';
  static const String fundTransfer = 'fund_transfer';
  static const String fundTransferWithinBank = 'fund_transfer_bank';
  static const String addBeneficiary = 'add_beneficiary';
  static const String impsQuickTransferMode = 'imps_mode';
  static const String transferredSuccessfully = 'trans_successfully';
  static const String loansPage = 'loans_page';
  static const String travelLoans = 'travel_loans';
  static const String loanStatement = 'loan_statement';
  static const String deposits = 'deposits';
  static const String makeADeposit = 'make_a_deposit';
  static const String profilePage = 'profile_page';
  static const String nearbyBanks = 'nearby_banks';
  static const String faqsPage = 'faq_page';
  static const String supportPage = 'support_page';
  static const String tnc = 'tnc';
  static const String accountPage = 'account_page';
  static const String transactionsPage = 'transactions_page';
  static const String languagePage = 'language_page';

  Map<String, WidgetBuilder> routes() {
    return {
      addThumbImpression: (context) => AssignThumbImpression(),
      homePage: (context) => HomePage(),
      appNavigation: (context) => AppNavigation(),
      fundTransfer: (context) => FundTransfer(),
      fundTransferWithinBank: (context) => FundTransferWithinBank(),
      addBeneficiary: (context) => AddBeneficiary(),
      impsQuickTransferMode: (context) => IMPSQuickTransferMode(),
      transferredSuccessfully: (context) => TransferredSuccessfully(),
      loansPage: (context) => LoansPage(),
      travelLoans: (context) => TravelLoan(),
      loanStatement: (context) => LoanStatement(),
      deposits: (context) => DepositsPage(),
      makeADeposit: (context) => MakeDepositPage(),
      profilePage: (context) => ProfilePage(),
      nearbyBanks: (context) => NearbyBanks(),
      faqsPage: (context) => FAQPage(),
      supportPage: (context) => SupportPage(),
      tnc: (context) => TermsConditions(),
      accountPage: (context) => AccountPage(),
      transactionsPage: (context) => Transactions(),
      languagePage: (context) => ChangeLanguagePage(),
    };
  }
}
