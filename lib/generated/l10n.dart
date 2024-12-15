// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Suivant`
  String get title {
    return Intl.message(
      'Suivant',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Livraison Express à Votre Porte!`
  String get hello {
    return Intl.message(
      'Livraison Express à Votre Porte!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Avec notre application, suivez vos livraisons en temps réel et recevez vos colis en toute sécurité. Essayez-la dès aujourd’hui !`
  String get name {
    return Intl.message(
      'Avec notre application, suivez vos livraisons en temps réel et recevez vos colis en toute sécurité. Essayez-la dès aujourd’hui !',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Français`
  String get title1 {
    return Intl.message(
      'Français',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Arabe`
  String get title2 {
    return Intl.message(
      'Arabe',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Entrez votre numéro de téléphone!`
  String get title3 {
    return Intl.message(
      'Entrez votre numéro de téléphone!',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `Le numéro de téléphone est obligatoire.`
  String get title4 {
    return Intl.message(
      'Le numéro de téléphone est obligatoire.',
      name: 'title4',
      desc: '',
      args: [],
    );
  }

  /// `Etes-vous sûr du numéro ?`
  String get title5 {
    return Intl.message(
      'Etes-vous sûr du numéro ?',
      name: 'title5',
      desc: '',
      args: [],
    );
  }

  /// `Oui`
  String get title6 {
    return Intl.message(
      'Oui',
      name: 'title6',
      desc: '',
      args: [],
    );
  }

  /// `Non`
  String get title7 {
    return Intl.message(
      'Non',
      name: 'title7',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get title8 {
    return Intl.message(
      'Ok',
      name: 'title8',
      desc: '',
      args: [],
    );
  }

  /// `Numéro de téléphone invalide`
  String get title9 {
    return Intl.message(
      'Numéro de téléphone invalide',
      name: 'title9',
      desc: '',
      args: [],
    );
  }

  /// `Numéro de ...`
  String get title10 {
    return Intl.message(
      'Numéro de ...',
      name: 'title10',
      desc: '',
      args: [],
    );
  }

  /// `Entrez le code envoyé à votre numéro de téléphone.`
  String get title11 {
    return Intl.message(
      'Entrez le code envoyé à votre numéro de téléphone.',
      name: 'title11',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe est incorrect`
  String get title12 {
    return Intl.message(
      'Le mot de passe est incorrect',
      name: 'title12',
      desc: '',
      args: [],
    );
  }

  /// `Verifier`
  String get title13 {
    return Intl.message(
      'Verifier',
      name: 'title13',
      desc: '',
      args: [],
    );
  }

  /// `Verifier ton numéro`
  String get title14 {
    return Intl.message(
      'Verifier ton numéro',
      name: 'title14',
      desc: '',
      args: [],
    );
  }

  /// `Homme`
  String get title15 {
    return Intl.message(
      'Homme',
      name: 'title15',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get title16 {
    return Intl.message(
      'About',
      name: 'title16',
      desc: '',
      args: [],
    );
  }

  /// `Se déconnecter`
  String get title17 {
    return Intl.message(
      'Se déconnecter',
      name: 'title17',
      desc: '',
      args: [],
    );
  }

  /// `Votre nom personnel`
  String get title18 {
    return Intl.message(
      'Votre nom personnel',
      name: 'title18',
      desc: '',
      args: [],
    );
  }

  /// `nom de famille`
  String get title19 {
    return Intl.message(
      'nom de famille',
      name: 'title19',
      desc: '',
      args: [],
    );
  }

  /// `Champ vide!`
  String get title20 {
    return Intl.message(
      'Champ vide!',
      name: 'title20',
      desc: '',
      args: [],
    );
  }

  /// `Veuillez saisir les informations suivantes`
  String get title21 {
    return Intl.message(
      'Veuillez saisir les informations suivantes',
      name: 'title21',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenu(e) dans l'application`
  String get title22 {
    return Intl.message(
      'Bienvenu(e) dans l\'application',
      name: 'title22',
      desc: '',
      args: [],
    );
  }

  /// `FAST`
  String get title23 {
    return Intl.message(
      'FAST',
      name: 'title23',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY`
  String get title24 {
    return Intl.message(
      'DELIVERY',
      name: 'title24',
      desc: '',
      args: [],
    );
  }

  /// `Lancer`
  String get title25 {
    return Intl.message(
      'Lancer',
      name: 'title25',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation de votre demande`
  String get title26 {
    return Intl.message(
      'Confirmation de votre demande',
      name: 'title26',
      desc: '',
      args: [],
    );
  }

  /// `Etes-vous sûr d'avoir envoyé votre demande ?`
  String get title27 {
    return Intl.message(
      'Etes-vous sûr d\'avoir envoyé votre demande ?',
      name: 'title27',
      desc: '',
      args: [],
    );
  }

  /// `réussi !`
  String get title28 {
    return Intl.message(
      'réussi !',
      name: 'title28',
      desc: '',
      args: [],
    );
  }

  /// `Votre demande a été envoyée et un de nos collaborateurs vous contactera dans les plus brefs délais. Et merci, nous appellerons votre numéro`
  String get title29 {
    return Intl.message(
      'Votre demande a été envoyée et un de nos collaborateurs vous contactera dans les plus brefs délais. Et merci, nous appellerons votre numéro',
      name: 'title29',
      desc: '',
      args: [],
    );
  }

  /// `Détails de l'application`
  String get T1 {
    return Intl.message(
      'Détails de l\'application',
      name: 'T1',
      desc: '',
      args: [],
    );
  }

  /// `Télécharger`
  String get T2 {
    return Intl.message(
      'Télécharger',
      name: 'T2',
      desc: '',
      args: [],
    );
  }

  /// `Se connecter`
  String get T3 {
    return Intl.message(
      'Se connecter',
      name: 'T3',
      desc: '',
      args: [],
    );
  }

  /// `Situer`
  String get T4 {
    return Intl.message(
      'Situer',
      name: 'T4',
      desc: '',
      args: [],
    );
  }

  /// `Demande`
  String get T5 {
    return Intl.message(
      'Demande',
      name: 'T5',
      desc: '',
      args: [],
    );
  }

  /// `Vous téléchargerez l'application depuis Google Play ou ApStore et la mettrez sur votre téléphone personnel`
  String get T6 {
    return Intl.message(
      'Vous téléchargerez l\'application depuis Google Play ou ApStore et la mettrez sur votre téléphone personnel',
      name: 'T6',
      desc: '',
      args: [],
    );
  }

  /// `La méthode d'inscription est très simple. Vous entrerez votre numéro de téléphone, que vous entrerez dans votre téléphone, et il sera vérifié, et après cela, le mot de passe sera envoyé sur votre téléphone.`
  String get T7 {
    return Intl.message(
      'La méthode d\'inscription est très simple. Vous entrerez votre numéro de téléphone, que vous entrerez dans votre téléphone, et il sera vérifié, et après cela, le mot de passe sera envoyé sur votre téléphone.',
      name: 'T7',
      desc: '',
      args: [],
    );
  }

  /// `Lorsque vous entrez dans l'interface principale, il vous sera demandé l'autorisation d'accéder à votre emplacement actuel. Vous devez autoriser l'accès à l'application. Si vous êtes refusé, l'autorisation vous sera demandée à nouveau. Si vous refusez définitivement, cela signifie que vous serez bloqué. de l'application.`
  String get T8 {
    return Intl.message(
      'Lorsque vous entrez dans l\'interface principale, il vous sera demandé l\'autorisation d\'accéder à votre emplacement actuel. Vous devez autoriser l\'accès à l\'application. Si vous êtes refusé, l\'autorisation vous sera demandée à nouveau. Si vous refusez définitivement, cela signifie que vous serez bloqué. de l\'application.',
      name: 'T8',
      desc: '',
      args: [],
    );
  }

  /// `D'un simple clic, votre demande sera envoyée aux travailleurs. Les travailleurs recevront un message comprenant votre numéro de téléphone, votre emplacement et votre distance, et l'un d'eux vous appellera sur votre numéro de téléphone.`
  String get T9 {
    return Intl.message(
      'D\'un simple clic, votre demande sera envoyée aux travailleurs. Les travailleurs recevront un message comprenant votre numéro de téléphone, votre emplacement et votre distance, et l\'un d\'eux vous appellera sur votre numéro de téléphone.',
      name: 'T9',
      desc: '',
      args: [],
    );
  }

  /// `Nom`
  String get T10 {
    return Intl.message(
      'Nom',
      name: 'T10',
      desc: '',
      args: [],
    );
  }

  /// `Téléphone`
  String get T11 {
    return Intl.message(
      'Téléphone',
      name: 'T11',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
