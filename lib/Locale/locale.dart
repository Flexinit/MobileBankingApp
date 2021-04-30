import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
  };

  String get newUser {
    return _localizedValues[locale.languageCode]['newUser'];
  }

  String get orSignInWithCustomerID {
    return _localizedValues[locale.languageCode]['orSignInWithCustomerID'];
  }

  String get phoneCustomerID {
    return _localizedValues[locale.languageCode]['phoneCustomerID'];
  }

  String get phoneFieldEmpty {
    return _localizedValues[locale.languageCode]['phoneFieldEmpty'];
  }

  String get passwordFieldEmpty {
    return _localizedValues[locale.languageCode]['passwordFieldEmpty'];
  }

  String get accountFieldEmpty {
    return _localizedValues[locale.languageCode]['accountFieldEmpty'];
  }

  String get entermPin {
    return _localizedValues[locale.languageCode]['entermPin'];
  }

  String get confirmPassword {
    return _localizedValues[locale.languageCode]['confirmPassword'];
  }

  String get mPinFieldEmpty {
    return _localizedValues[locale.languageCode]['mPinFieldEmpty'];
  }

  String get passwordLength {
    return _localizedValues[locale.languageCode]['passwordLength'];
  }

  String get signIn {
    return _localizedValues[locale.languageCode]['signIn'];
  }

  String get orScanYourThumbToContinue {
    return _localizedValues[locale.languageCode]['orScanYourThumbToContinue'];
  }

  String get orRegisterToContinue {
    return _localizedValues[locale.languageCode]['orRegisterContinue'];
  }

  String get registerWithYourBankingDetails {
    return _localizedValues[locale.languageCode]
        ['registerWithYourBankingDetails'];
  }

  String get enterAccountNumber {
    return _localizedValues[locale.languageCode]['enterAccountNumber'];
  }

  String get youWillReceiveOTPonRegPhone {
    return _localizedValues[locale.languageCode]['youWillReceiveOTPonRegPhone'];
  }

  String get verification {
    return _localizedValues[locale.languageCode]['verification'];
  }

  String get enterOTPSentOn {
    return _localizedValues[locale.languageCode]['enterOTPSentOn'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['changeLanguage'];
  }

  String get enterOTPCode {
    return _localizedValues[locale.languageCode]['enterOTPCode'];
  }

  String get onceYouVerifyPhoneNumber {
    return _localizedValues[locale.languageCode]['onceYouVerifyPhoneNumber'];
  }

  String get assignYourThumbImpression {
    return _localizedValues[locale.languageCode]['assignYourThumbImpression'];
  }

  String get accTitle1 {
    return _localizedValues[locale.languageCode]['accTitle1'];
  }

  String get accTitle2 {
    return _localizedValues[locale.languageCode]['accTitle2'];
  }

  String get accTitle3 {
    return _localizedValues[locale.languageCode]['accTitle3'];
  }

  String get accTitle4 {
    return _localizedValues[locale.languageCode]['accTitle4'];
  }

  String get accTitle5 {
    return _localizedValues[locale.languageCode]['accTitle5'];
  }

  String get accTitle6 {
    return _localizedValues[locale.languageCode]['accTitle6'];
  }

  String get accSub1 {
    return _localizedValues[locale.languageCode]['accSub1'];
  }

  String get accSub2 {
    return _localizedValues[locale.languageCode]['accSub2'];
  }

  String get accSub3 {
    return _localizedValues[locale.languageCode]['accSub3'];
  }

  String get accSub4 {
    return _localizedValues[locale.languageCode]['accSub4'];
  }

  String get accSub5 {
    return _localizedValues[locale.languageCode]['accSub5'];
  }

  String get accSub6 {
    return _localizedValues[locale.languageCode]['accSub6'];
  }

  String get account {
    return _localizedValues[locale.languageCode]['account'];
  }

  String get viewProfile {
    return _localizedValues[locale.languageCode]['viewProfile'];
  }

  String get faq1 {
    return _localizedValues[locale.languageCode]['faq1'];
  }

  String get faq2 {
    return _localizedValues[locale.languageCode]['faq2'];
  }

  String get faq3 {
    return _localizedValues[locale.languageCode]['faq3'];
  }

  String get faq4 {
    return _localizedValues[locale.languageCode]['faq4'];
  }

  String get faq5 {
    return _localizedValues[locale.languageCode]['faq5'];
  }

  String get faq6 {
    return _localizedValues[locale.languageCode]['faq6'];
  }

  String get faqs {
    return _localizedValues[locale.languageCode]['faqs'];
  }

  String get nearbyBanksATM {
    return _localizedValues[locale.languageCode]['nearbyBanksATM'];
  }

  String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }

  String get profile {
    return _localizedValues[locale.languageCode]['profile'];
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }

  String get accountNumber {
    return _localizedValues[locale.languageCode]['accountNumber'];
  }

  String get customerID {
    return _localizedValues[locale.languageCode]['customerID'];
  }

  String get updateProfile {
    return _localizedValues[locale.languageCode]['updateProfile'];
  }

  String get support {
    return _localizedValues[locale.languageCode]['support'];
  }

  String get wereHere {
    return _localizedValues[locale.languageCode]['wereHere'];
  }

  String get fragmentPark {
    return _localizedValues[locale.languageCode]['fragmentPark'];
  }

  String get connectUs {
    return _localizedValues[locale.languageCode]['connectUs'];
  }

  String get writeUsDirectly {
    return _localizedValues[locale.languageCode]['writeUsDirectly'];
  }

  String get yourMessage {
    return _localizedValues[locale.languageCode]['yourMessage'];
  }

  String get tnc {
    return _localizedValues[locale.languageCode]['tnc'];
  }

  String get termsOfUse {
    return _localizedValues[locale.languageCode]['termsOfUse'];
  }

  String get deposits {
    return _localizedValues[locale.languageCode]['deposits'];
  }

  String get uploadDeposit {
    return _localizedValues[locale.languageCode]['uploadDeposit'];
  }

  String get pendingDeposits {
    return _localizedValues[locale.languageCode]['pendingDeposits'];
  }

  String get pastDeposited {
    return _localizedValues[locale.languageCode]['pastDeposited'];
  }

  String get depositTo {
    return _localizedValues[locale.languageCode]['depositTo'];
  }

  String get amount {
    return _localizedValues[locale.languageCode]['amount'];
  }

  String get uploadedOn {
    return _localizedValues[locale.languageCode]['uploadedOn'];
  }

  String get status {
    return _localizedValues[locale.languageCode]['status'];
  }

  String get pending {
    return _localizedValues[locale.languageCode]['pending'];
  }

  String get deposited {
    return _localizedValues[locale.languageCode]['deposited'];
  }

  String get makeADeposit {
    return _localizedValues[locale.languageCode]['makeADeposit'];
  }

  String get frontSide {
    return _localizedValues[locale.languageCode]['frontSide'];
  }

  String get delete {
    return _localizedValues[locale.languageCode]['delete'];
  }

  String get backSide {
    return _localizedValues[locale.languageCode]['backSide'];
  }

  String get selectAccount {
    return _localizedValues[locale.languageCode]['selectAccount'];
  }

  String get transferNow {
    return _localizedValues[locale.languageCode]['transferNow'];
  }

  String get addBeneficiary {
    return _localizedValues[locale.languageCode]['addBeneficiary'];
  }

  String get beneficiaryBank {
    return _localizedValues[locale.languageCode]['beneficiaryBank'];
  }

  String get beneficiaryFullName {
    return _localizedValues[locale.languageCode]['beneficiaryFullName'];
  }

  String get beneficiaryBankAccount {
    return _localizedValues[locale.languageCode]['beneficiaryBankAccount'];
  }

  String get transferLimit {
    return _localizedValues[locale.languageCode]['transferLimit'];
  }

  String get submit {
    return _localizedValues[locale.languageCode]['submit'];
  }

  String get fundTransfer {
    return _localizedValues[locale.languageCode]['fundTransfer'];
  }

  String get withinBank {
    return _localizedValues[locale.languageCode]['withinBank'];
  }

  String get toOtherBank {
    return _localizedValues[locale.languageCode]['toOtherBank'];
  }

  String get neft {
    return _localizedValues[locale.languageCode]['neft'];
  }

  String get transferMoney {
    return _localizedValues[locale.languageCode]['transferMoney'];
  }

  String get rtgs {
    return _localizedValues[locale.languageCode]['rtgs'];
  }

  String get easiestModeToTransfer {
    return _localizedValues[locale.languageCode]['easiestModeToTransfer'];
  }

  String get imps {
    return _localizedValues[locale.languageCode]['imps'];
  }

  String get quickTransferMode {
    return _localizedValues[locale.languageCode]['quickTransferMode'];
  }

  String get fromAccount {
    return _localizedValues[locale.languageCode]['fromAccount'];
  }

  String get accountHolderName {
    return _localizedValues[locale.languageCode]['accountHolderName'];
  }

  String get bankName {
    return _localizedValues[locale.languageCode]['bankName'];
  }

  String get ifscCode {
    return _localizedValues[locale.languageCode]['ifscCode'];
  }

  String get enterAmount {
    return _localizedValues[locale.languageCode]['enterAmount'];
  }

  String get done {
    return _localizedValues[locale.languageCode]['done'];
  }

  String get transferredSuccessfully {
    return _localizedValues[locale.languageCode]['transferredSuccessfully'];
  }

  String get transferredTo {
    return _localizedValues[locale.languageCode]['transferredTo'];
  }

  String get from {
    return _localizedValues[locale.languageCode]['from'];
  }

  String get amountTransferred {
    return _localizedValues[locale.languageCode]['amountTransferred'];
  }

  String get paymentMode {
    return _localizedValues[locale.languageCode]['paymentMode'];
  }

  String get remark {
    return _localizedValues[locale.languageCode]['remark'];
  }

  String get sendForHomeRent {
    return _localizedValues[locale.languageCode]['sendForHomeRent'];
  }

  String get sentOnDate {
    return _localizedValues[locale.languageCode]['sentOnDate'];
  }

  String get sendMore {
    return _localizedValues[locale.languageCode]['sendMore'];
  }

  String get backToHome {
    return _localizedValues[locale.languageCode]['backToHome'];
  }

  String get toAccount {
    return _localizedValues[locale.languageCode]['toAccount'];
  }

  String get enterRemark {
    return _localizedValues[locale.languageCode]['enterRemark'];
  }

  String get chooseBeneficiary {
    return _localizedValues[locale.languageCode]['chooseBeneficiary'];
  }

  String get emiDebited {
    return _localizedValues[locale.languageCode]['emiDebited'];
  }

  String get loanStatement {
    return _localizedValues[locale.languageCode]['loanStatement'];
  }

  String get recentTransactions {
    return _localizedValues[locale.languageCode]['recentTransactions'];
  }

  String get loans {
    return _localizedValues[locale.languageCode]['loans'];
  }

  String get loanOffersAvailable {
    return _localizedValues[locale.languageCode]['loanOffersAvailable'];
  }

  String get travelLoan {
    return _localizedValues[locale.languageCode]['travelLoan'];
  }

  String get phoneNumber {
    return _localizedValues[locale.languageCode]['phoneNumber'];
  }

  String get enterYourPhoneNumber {
    return _localizedValues[locale.languageCode]['enterYourPhoneNumber'];
  }

  String get yourMsg {
    return _localizedValues[locale.languageCode]['yourMsg'];
  }

  String get enterYourMsg {
    return _localizedValues[locale.languageCode]['enterYourMsg'];
  }

  String get iAmInterested {
    return _localizedValues[locale.languageCode]['iAmInterested'];
  }

  String get statement {
    return _localizedValues[locale.languageCode]['statement'];
  }

  String get more {
    return _localizedValues[locale.languageCode]['more'];
  }

  String get savingAccount {
    return _localizedValues[locale.languageCode]['savingAccount'];
  }

  String get checkBalance {
    return _localizedValues[locale.languageCode]['checkBalance'];
  }

  String get randomDate {
    return _localizedValues[locale.languageCode]['randomDate'];
  }

  String get transactions {
    return _localizedValues[locale.languageCode]['transactions'];
  }

  String get availableBalance {
    return _localizedValues[locale.languageCode]['availableBalance'];
  }

  String get currentAccount {
    return _localizedValues[locale.languageCode]['currentAccount'];
  }

  String get banking {
    return _localizedValues[locale.languageCode]['banking'];
  }

  String get continuee {
    return _localizedValues[locale.languageCode]['continuee'];
  }

  String get homeLoan {
    return _localizedValues[locale.languageCode]['homeLoan'];
  }

  String get viewStatement {
    return _localizedValues[locale.languageCode]['viewStatement'];
  }

  String get dueAmount {
    return _localizedValues[locale.languageCode]['dueAmount'];
  }

  String get emi {
    return _localizedValues[locale.languageCode]['emi'];
  }

  String get assignThumbImpression {
    return _localizedValues[locale.languageCode]['assignThumbImpression'];
  }

  String get enterYourThumbImpression {
    return _localizedValues[locale.languageCode]['enterYourThumbImpression'];
  }

  String get timesToAssign {
    return _localizedValues[locale.languageCode]['timesToAssign'];
  }

  String get tips {
    return _localizedValues[locale.languageCode]['tips'];
  }

  String get tryToTapWithDifferentSidesOfThumb {
    return _localizedValues[locale.languageCode]
        ['tryToTapWithDifferentSidesOfThumb'];
  }

  String get addOftenlyUsedThumbToAssign {
    return _localizedValues[locale.languageCode]['addOftenlyUsedThumbToAssign'];
  }

  String get youCanChangeThumbImpressionLater {
    return _localizedValues[locale.languageCode]
        ['youCanChangeThumbImpressionLater'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'id', 'pt', 'fr', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
