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

  /// `No Permission Granted`
  String get NoPermissionGranted {
    return Intl.message(
      'No Permission Granted',
      name: 'NoPermissionGranted',
      desc: '',
      args: [],
    );
  }

  /// `Can not get Location. Time expired`
  String get ExceptionTimeExpired {
    return Intl.message(
      'Can not get Location. Time expired',
      name: 'ExceptionTimeExpired',
      desc: '',
      args: [],
    );
  }

  /// `Please, check is Location Service enabled`
  String get ExceptionCheckLocationService {
    return Intl.message(
      'Please, check is Location Service enabled',
      name: 'ExceptionCheckLocationService',
      desc: '',
      args: [],
    );
  }

  /// `Current weather`
  String get CurrentWeather {
    return Intl.message(
      'Current weather',
      name: 'CurrentWeather',
      desc: '',
      args: [],
    );
  }

  /// `Search city`
  String get SearchCity {
    return Intl.message(
      'Search city',
      name: 'SearchCity',
      desc: '',
      args: [],
    );
  }

  /// `Check internet connection`
  String get CheckConnection {
    return Intl.message(
      'Check internet connection',
      name: 'CheckConnection',
      desc: '',
      args: [],
    );
  }

  /// `d`
  String get Days {
    return Intl.message(
      'd',
      name: 'Days',
      desc: '',
      args: [],
    );
  }

  /// `min ago`
  String get Minutes {
    return Intl.message(
      'min ago',
      name: 'Minutes',
      desc: '',
      args: [],
    );
  }

  /// `h`
  String get Hours {
    return Intl.message(
      'h',
      name: 'Hours',
      desc: '',
      args: [],
    );
  }

  /// `Last update:`
  String get LastUpdate {
    return Intl.message(
      'Last update:',
      name: 'LastUpdate',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
