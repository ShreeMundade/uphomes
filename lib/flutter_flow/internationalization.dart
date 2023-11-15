import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    '8yq53839': {
      'en': 'Welcome Back,',
      'hi': 'वापसी पर स्वागत है,',
    },
    '4capcu8j': {
      'en': 'Email Address',
      'hi': 'मेल पता',
    },
    'lim4n56d': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
    },
    'a131t0yf': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    'xrdsydq9': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
    },
    'egc126by': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
    },
    'wdxrf1sw': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
    },
    '6wu563ca': {
      'en': 'Don\'t have an account?',
      'hi': 'कोई खाता नहीं है?',
    },
    '5ky66j31': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    '1xqmpsm9': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // createAccount
  {
    '27y97qu5': {
      'en': 'Get Started Below,',
      'hi': '',
    },
    'fgass2qj': {
      'en': 'Email Address',
      'hi': '',
    },
    'wokibpwy': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'llcry2mm': {
      'en': 'Password',
      'hi': '',
    },
    'rxnxehg7': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'pcoxd9vl': {
      'en': 'Create Account',
      'hi': '',
    },
    '1phcewo2': {
      'en': 'Already have an account?',
      'hi': '',
    },
    'va7ogk6e': {
      'en': 'Login',
      'hi': '',
    },
    '0k4k1s68': {
      'en': 'Home',
      'hi': '',
    },
  },
  // homePage_MAIN
  {
    'lfsflqhi': {
      'en': 'Welcome!',
      'hi': '',
    },
    '4bify6rq': {
      'en': 'Find your Dream Space To Getaway',
      'hi': '',
    },
    'oa9iwuyh': {
      'en': 'Address, city, state...',
      'hi': '',
    },
    '9yh4zc0m': {
      'en': 'Search',
      'hi': '',
    },
    '3ymm15m4': {
      'en': 'Rating',
      'hi': '',
    },
    '0fn0axqp': {
      'en': 'Home',
      'hi': '',
    },
  },
  // propertyDetails
  {
    'b3l8unfa': {
      'en': 'Reviews',
      'hi': '',
    },
    'hprxnul2': {
      'en': 'DESCRIPTION',
      'hi': '',
    },
    'zwzrj0y5': {
      'en': 'Amenities',
      'hi': '',
    },
    'hqchwa0w': {
      'en': 'What people are saying',
      'hi': '',
    },
    'qpnpop3m': {
      'en': 'Josh Richardson',
      'hi': '',
    },
    'oza8jf1f': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
    },
    'c5lfh7ej': {
      'en': 'Josh Richardson',
      'hi': '',
    },
    'yq3muk1o': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
    },
    '4e6pkr8b': {
      'en': '\$156',
      'hi': '',
    },
    '0s7l4oub': {
      'en': '+ taxes/fees',
      'hi': '',
    },
    'gf6lf4fa': {
      'en': 'per night',
      'hi': '',
    },
    '8zu9hwae': {
      'en': 'Book Now',
      'hi': '',
    },
    'o1faztze': {
      'en': 'Home',
      'hi': '',
    },
  },
  // searchProperties
  {
    'z5df5fob': {
      'en': 'Search',
      'hi': '',
    },
    '4v4nxgow': {
      'en': 'Address, city, state...',
      'hi': '',
    },
    '6qzo0eql': {
      'en': 'Search',
      'hi': '',
    },
    '1130mhqh': {
      'en': 'Rating',
      'hi': '',
    },
    'dil2y1i9': {
      'en': 'Home',
      'hi': '',
    },
  },
  // myTrips
  {
    'czagc4wu': {
      'en': 'Upcoming',
      'hi': '',
    },
    '3dsgvujv': {
      'en': ' - ',
      'hi': '',
    },
    'xheoin2y': {
      'en': 'Total',
      'hi': '',
    },
    'lyzl502k': {
      'en': 'Completed',
      'hi': '',
    },
    'y4rq87lv': {
      'en': 'Cancelled',
      'hi': '',
    },
    'zxh0r5ps': {
      'en': ' - ',
      'hi': '',
    },
    '571votlu': {
      'en': 'Rate Trip',
      'hi': '',
    },
    'jte20n9q': {
      'en': 'My Trips',
      'hi': '',
    },
    'eckn82x7': {
      'en': 'My Trips',
      'hi': '',
    },
  },
  // tripDetails
  {
    'vgsj6ww0': {
      'en': 'Trip Details',
      'hi': '',
    },
    'acif3oj7': {
      'en': 'Dates of trip',
      'hi': '',
    },
    'wtvttyit': {
      'en': ' - ',
      'hi': '',
    },
    '9c1g1bog': {
      'en': 'Destination',
      'hi': '',
    },
    '47fyhc27': {
      'en': 'Price Breakdown',
      'hi': '',
    },
    'qoclqdh2': {
      'en': 'Base Price',
      'hi': '',
    },
    'nj8ncdid': {
      'en': 'Taxes',
      'hi': '',
    },
    's7fxlza3': {
      'en': '\$24.20',
      'hi': '',
    },
    '2yrjpaiy': {
      'en': 'Cleaning Fee',
      'hi': '',
    },
    'gtfoflvb': {
      'en': '\$40.00',
      'hi': '',
    },
    'aucpsfc0': {
      'en': 'Total',
      'hi': '',
    },
    'zd0y2tz1': {
      'en': 'Your trip has been completed!',
      'hi': '',
    },
    'vzf18m4n': {
      'en': 'Review Trip',
      'hi': '',
    },
    '4al6bson': {
      'en': 'Host Info',
      'hi': '',
    },
    'icqzmlo3': {
      'en': 'Chat',
      'hi': '',
    },
    'xn2oecet': {
      'en': 'Home',
      'hi': '',
    },
  },
  // chatMain
  {
    '4rybxrth': {
      'en': 'All Chats',
      'hi': '',
    },
    '0tojbtju': {
      'en': 'Chats',
      'hi': '',
    },
  },
  // chatDetails
  {
    '3n7tz63h': {
      'en': 'Home',
      'hi': '',
    },
  },
  // propertyReview
  {
    'hvnw2yk8': {
      'en': 'Reviews',
      'hi': '',
    },
    '8hx9ff3k': {
      'en': '# of Ratings',
      'hi': '',
    },
    'f9s1k2kd': {
      'en': 'Avg. Rating',
      'hi': '',
    },
    'jndwi06c': {
      'en': 'Home',
      'hi': '',
    },
  },
  // bookNow
  {
    'bpy037yg': {
      'en': 'Book Now',
      'hi': '',
    },
    'ri3rhvgm': {
      'en': 'Choose Dates',
      'hi': '',
    },
    'y40m5kek': {
      'en': 'Number of Guests',
      'hi': '',
    },
    'kkm0y7ch': {
      'en': 'Choose an Option',
      'hi': '',
    },
    'z83vxk3t': {
      'en': 'Breakfast',
      'hi': '',
    },
    'okyc0i03': {
      'en': 'No Breakfast',
      'hi': '',
    },
    'dnqr0w45': {
      'en': 'Hot Tub Access',
      'hi': '',
    },
    'rqp76o12': {
      'en': 'No Access',
      'hi': '',
    },
    'wv60pse2': {
      'en': 'Payment Information',
      'hi': '',
    },
    '83l36ojs': {
      'en': 'Base Price',
      'hi': '',
    },
    'c9wabtch': {
      'en': '\$156.00',
      'hi': '',
    },
    'jl9qnkcq': {
      'en': 'Taxes',
      'hi': '',
    },
    'g2xvpnhm': {
      'en': '\$24.20',
      'hi': '',
    },
    'v016t4dm': {
      'en': 'Cleaning Fee',
      'hi': '',
    },
    'q79mqskf': {
      'en': '\$40.00',
      'hi': '',
    },
    '99gy6mmb': {
      'en': 'Total',
      'hi': '',
    },
    'joulhbkk': {
      'en': '\$230.20',
      'hi': '',
    },
    '5rtsno0v': {
      'en': 'Book Now',
      'hi': '',
    },
    'ojbi3eyx': {
      'en': 'Home',
      'hi': '',
    },
  },
  // profilePage
  {
    'a67p8vmk': {
      'en': 'Switch to Dark Mode',
      'hi': '',
    },
    '7n5iaap3': {
      'en': 'Switch to Light Mode',
      'hi': '',
    },
    'jtk33ezm': {
      'en': 'Account Details',
      'hi': '',
    },
    '4299ce8t': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'iare20e9': {
      'en': 'Payment Information',
      'hi': '',
    },
    'rdcoxexz': {
      'en': 'Change Password',
      'hi': '',
    },
    'fpt6mhxz': {
      'en': 'My Properties',
      'hi': '',
    },
    'g00hprer': {
      'en': 'My Bookings',
      'hi': '',
    },
    'uajaox2c': {
      'en': 'Log Out',
      'hi': '',
    },
    '047jzivw': {
      'en': 'Add Property',
      'hi': '',
    },
    'cvr256ej': {
      'en': 'Profile',
      'hi': '',
    },
  },
  // paymentInfo
  {
    'tptov9my': {
      'en': 'Save Changes',
      'hi': '',
    },
    'hgjf6nq2': {
      'en': 'Payment Information',
      'hi': '',
    },
    '9l50dz5d': {
      'en': 'Home',
      'hi': '',
    },
  },
  // editProfile
  {
    'rbbldtqm': {
      'en': 'Edit Profile',
      'hi': '',
    },
    '2lyx0doc': {
      'en': 'Change Photo',
      'hi': '',
    },
    '79nbp9ff': {
      'en': 'Full Name',
      'hi': '',
    },
    'lhib348k': {
      'en': 'Your full name...',
      'hi': '',
    },
    'abtqqlin': {
      'en': 'Email Address',
      'hi': '',
    },
    'iyuhjv85': {
      'en': 'Your email..',
      'hi': '',
    },
    'op6a49h1': {
      'en': 'Bio',
      'hi': '',
    },
    'khpqeag6': {
      'en': 'A little about you...',
      'hi': '',
    },
    'g308zmbt': {
      'en': 'Save Changes',
      'hi': '',
    },
    '6ddxd7e8': {
      'en': 'Home',
      'hi': '',
    },
  },
  // changePassword
  {
    'maes6aa8': {
      'en': 'Email Address',
      'hi': '',
    },
    'gm1lrdz8': {
      'en': 'Your email..',
      'hi': '',
    },
    'fktx1jvp': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'hi': '',
    },
    '315edjzs': {
      'en': 'Send Reset Link',
      'hi': '',
    },
    'h6q985ga': {
      'en': 'Change Password',
      'hi': '',
    },
    'gpfoeijx': {
      'en': 'Home',
      'hi': '',
    },
  },
  // createProperty_1
  {
    '8ffpjdaa': {
      'en': 'PROPERTY NAME',
      'hi': '',
    },
    'gju9tmyf': {
      'en': 'Something Catchy...',
      'hi': '',
    },
    'eo81mhrc': {
      'en': 'PROPERTY ADDRESS',
      'hi': '',
    },
    'wfkfjx39': {
      'en': '123 Disney way here…',
      'hi': '',
    },
    'fy547xi4': {
      'en': 'NEIGHBORHOOD',
      'hi': '',
    },
    'rgwelidj': {
      'en': 'Neighborhood or city…',
      'hi': '',
    },
    '35ue036f': {
      'en': 'DESCRIPTION',
      'hi': '',
    },
    '1p0h4nlm': {
      'en': 'Neighborhood or city…',
      'hi': '',
    },
    'kivjl176': {
      'en': 'STEP',
      'hi': '',
    },
    '4yt9timr': {
      'en': '1/3',
      'hi': '',
    },
    'qp0u23em': {
      'en': 'NEXT',
      'hi': '',
    },
    'keqyr7vf': {
      'en': 'Create Property',
      'hi': '',
    },
    'i52ioro1': {
      'en': 'Home',
      'hi': '',
    },
  },
  // HomePage_ALT
  {
    'kf82hb6g': {
      'en': 'Welcome!',
      'hi': '',
    },
    'k746bfse': {
      'en': 'Find your Dream Space',
      'hi': '',
    },
    '363icg11': {
      'en': 'Address, city, state...',
      'hi': '',
    },
    '7z5j3sho': {
      'en': 'Search',
      'hi': '',
    },
    'hgxpm2v8': {
      'en': '4/5 reviews',
      'hi': '',
    },
    'p9t7p4zp': {
      'en': 'Home',
      'hi': '',
    },
  },
  // createProperty_2
  {
    'jrz3054t': {
      'en': 'Create Property',
      'hi': '',
    },
    'qrms6caf': {
      'en': 'CHOOSE YOUR AMENITIES',
      'hi': '',
    },
    'nu4fuv8s': {
      'en': 'Pool',
      'hi': '',
    },
    'gu6yxe9q': {
      'en': 'EV Car Charging',
      'hi': '',
    },
    '399tc4zd': {
      'en': 'Extra Outlets',
      'hi': '',
    },
    'sbqcym03': {
      'en': 'Air Conditioning (AC)',
      'hi': '',
    },
    '241ixt0o': {
      'en': 'Heating',
      'hi': '',
    },
    'nh5a5ez1': {
      'en': 'Washer',
      'hi': '',
    },
    's3x7l6q9': {
      'en': 'Dryer',
      'hi': '',
    },
    '6zxca0bx': {
      'en': 'Pet Friendly',
      'hi': '',
    },
    'zxy9k30z': {
      'en': 'Workout Facility',
      'hi': '',
    },
    '9dlciive': {
      'en': 'Hip',
      'hi': '',
    },
    'z1y67u0i': {
      'en': 'Night Life',
      'hi': '',
    },
    'akx95ie5': {
      'en': 'STEP',
      'hi': '',
    },
    '3bpp01do': {
      'en': '2/3',
      'hi': '',
    },
    '7fefpnuq': {
      'en': 'NEXT',
      'hi': '',
    },
    '8ihjoqdl': {
      'en': 'Home',
      'hi': '',
    },
  },
  // createProperty_3
  {
    'h3arkmwo': {
      'en': 'Create Property',
      'hi': '',
    },
    '89lnloro': {
      'en': 'PRICE PER NIGHT',
      'hi': '',
    },
    '1k2tftu6': {
      'en': '\$ Price',
      'hi': '',
    },
    'owhuxzf2': {
      'en': 'MINIMUM NIGHT STAY',
      'hi': '',
    },
    'fwnnn5me': {
      'en': 'TAX RATE',
      'hi': '',
    },
    'dnzu3ug0': {
      'en': '% Rate',
      'hi': '',
    },
    '26364xuk': {
      'en': 'CLEANING FEE',
      'hi': '',
    },
    '7uhp1az1': {
      'en': '\$ Price',
      'hi': '',
    },
    '3v94i3g4': {
      'en': 'Additional Notes',
      'hi': '',
    },
    '0gm0wbds': {
      'en': 'Additional notes...',
      'hi': '',
    },
    '7ktestqx': {
      'en': 'STEP',
      'hi': '',
    },
    'v5m6jvsb': {
      'en': '3/3',
      'hi': '',
    },
    '0195gd7x': {
      'en': 'PUBLISH',
      'hi': '',
    },
    'aese2cbs': {
      'en': 'Home',
      'hi': '',
    },
  },
  // myProperties
  {
    'dc0ggor9': {
      'en': 'Published',
      'hi': '',
    },
    'vscaidnt': {
      'en': 'Price Per Night',
      'hi': '',
    },
    'pefocc43': {
      'en': 'Drafts',
      'hi': '',
    },
    'oaz4mg3g': {
      'en': 'Price Per Night',
      'hi': '',
    },
    '2632f40p': {
      'en': 'My Properties',
      'hi': '',
    },
    'zpayomos': {
      'en': 'My Trips',
      'hi': '',
    },
  },
  // propertyDetails_Owner
  {
    '1i67anew': {
      'en': 'Reviews',
      'hi': '',
    },
    'bs6z13vk': {
      'en': 'DESCRIPTION',
      'hi': '',
    },
    'zyr5cb0a': {
      'en': 'Amenities',
      'hi': '',
    },
    '2ismzdat': {
      'en': 'What people are saying',
      'hi': '',
    },
    'amyviniw': {
      'en': 'Josh Richardson',
      'hi': '',
    },
    'fr08uqxw': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
    },
    'eqkpy5mg': {
      'en': 'Josh Richardson',
      'hi': '',
    },
    'bke3eui8': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
    },
    'ui2apork': {
      'en': '\$156',
      'hi': '',
    },
    'javekri8': {
      'en': '+ taxes/fees',
      'hi': '',
    },
    'ifxcf206': {
      'en': 'per night',
      'hi': '',
    },
    '1akoi568': {
      'en': 'Edit Property',
      'hi': '',
    },
    'ws8ppvo7': {
      'en': 'Home',
      'hi': '',
    },
  },
  // myBookings
  {
    'gdn89tcu': {
      'en': 'Upcoming ',
      'hi': '',
    },
    'jizw30am': {
      'en': ' - ',
      'hi': '',
    },
    'fdci65h4': {
      'en': 'Total',
      'hi': '',
    },
    'uct966fm': {
      'en': 'Completed',
      'hi': '',
    },
    'buln8y7u': {
      'en': ' - ',
      'hi': '',
    },
    'zsijf9h6': {
      'en': 'Total',
      'hi': '',
    },
    'mphlkbr7': {
      'en': 'My Bookings',
      'hi': '',
    },
    '36rkwvb0': {
      'en': 'My Trips',
      'hi': '',
    },
  },
  // tripDetailsHOST
  {
    '7u3nyzpk': {
      'en': 'Trip Details',
      'hi': '',
    },
    'fsmepez4': {
      'en': 'Dates of trip',
      'hi': '',
    },
    'bdvgdsof': {
      'en': ' - ',
      'hi': '',
    },
    'fwu6dd42': {
      'en': 'Destination',
      'hi': '',
    },
    'snf0qwcn': {
      'en': 'Price Breakdown',
      'hi': '',
    },
    'kd6bxsio': {
      'en': 'Base Price',
      'hi': '',
    },
    'mxmr9dt7': {
      'en': 'Taxes',
      'hi': '',
    },
    '7ly8p84t': {
      'en': '\$24.20',
      'hi': '',
    },
    'mvo3jqrp': {
      'en': 'Cleaning Fee',
      'hi': '',
    },
    'b4y985t3': {
      'en': '\$40.00',
      'hi': '',
    },
    'v93monp0': {
      'en': 'Total',
      'hi': '',
    },
    'ymkwz4k0': {
      'en': 'Mark this trip as complete below.',
      'hi': '',
    },
    'h2evj89w': {
      'en': 'Mark as Complete',
      'hi': '',
    },
    'snndsgc7': {
      'en': 'Guest Info',
      'hi': '',
    },
    '9cg8fpuc': {
      'en': 'Chat',
      'hi': '',
    },
    '9i9yopwj': {
      'en': 'Home',
      'hi': '',
    },
  },
  // editProperty_1
  {
    'g399yp5u': {
      'en': 'Edit Property',
      'hi': '',
    },
    'rvdq0w7j': {
      'en': 'PROPERTY NAME',
      'hi': '',
    },
    'ti3htmt9': {
      'en': 'Something Catchy...',
      'hi': '',
    },
    'pvh59hh1': {
      'en': 'PROPERTY ADDRESS',
      'hi': '',
    },
    'zr4mv89f': {
      'en': '123 Disney way here…',
      'hi': '',
    },
    '7tru6rnl': {
      'en': 'NEIGHBORHOOD',
      'hi': '',
    },
    'h2pfcoz0': {
      'en': 'Neighborhood or city…',
      'hi': '',
    },
    'pk16zu5d': {
      'en': 'DESCRIPTION',
      'hi': '',
    },
    'xszhg3x5': {
      'en': 'Neighborhood or city…',
      'hi': '',
    },
    'a9k5m9ui': {
      'en': 'STEP',
      'hi': '',
    },
    'bl4mk3t2': {
      'en': '1/3',
      'hi': '',
    },
    'ooz1aotx': {
      'en': 'NEXT',
      'hi': '',
    },
    '6250q14t': {
      'en': 'We need to know the name of the place...',
      'hi': '',
    },
    'g28zfig6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // editProperty_2
  {
    'ckgw7xdv': {
      'en': 'Edit Property',
      'hi': '',
    },
    'ex5ty0zo': {
      'en': 'CHOOSE YOUR AMENITIES',
      'hi': '',
    },
    'zr7benqg': {
      'en': 'Pool',
      'hi': '',
    },
    'wvlxwgrb': {
      'en': 'EV Car Charging',
      'hi': '',
    },
    'rlcsxxvv': {
      'en': 'Extra Outlets',
      'hi': '',
    },
    '6ez8lq2c': {
      'en': 'Air Conditioning (AC)',
      'hi': '',
    },
    '6ym1xb60': {
      'en': 'Heating',
      'hi': '',
    },
    'oninsyt8': {
      'en': 'Washer',
      'hi': '',
    },
    'sh19o6mf': {
      'en': 'Dryer',
      'hi': '',
    },
    'd5b5sg79': {
      'en': 'Pet Friendly',
      'hi': '',
    },
    'tmcs1koy': {
      'en': 'Workout Facility',
      'hi': '',
    },
    'mm0jvpqh': {
      'en': 'Hip',
      'hi': '',
    },
    'uibahaft': {
      'en': 'Night Life',
      'hi': '',
    },
    '5im5wz09': {
      'en': 'STEP',
      'hi': '',
    },
    '0d4om04f': {
      'en': '2/3',
      'hi': '',
    },
    'lehknga1': {
      'en': 'NEXT',
      'hi': '',
    },
    '2knhlt3p': {
      'en': 'Home',
      'hi': '',
    },
  },
  // editProperty_3
  {
    '4c6vj8jp': {
      'en': 'Edit Property',
      'hi': '',
    },
    'ox1ek214': {
      'en': 'PRICE PER NIGHT',
      'hi': '',
    },
    '85uwgxs7': {
      'en': '\$ Price',
      'hi': '',
    },
    'j12e3s93': {
      'en': 'MINIMUM NIGHT STAY',
      'hi': '',
    },
    '8mxxznvm': {
      'en': 'TAX RATE',
      'hi': '',
    },
    '6yej08qz': {
      'en': '% Rate',
      'hi': '',
    },
    'pq0rxmmp': {
      'en': 'CLEANING FEE',
      'hi': '',
    },
    'dhw42i8o': {
      'en': '\$ Price',
      'hi': '',
    },
    'knyf58vs': {
      'en': 'Additional Notes',
      'hi': '',
    },
    'jrq7euht': {
      'en': 'Additional notes...',
      'hi': '',
    },
    'sa6x3k7e': {
      'en': 'Listing is Live',
      'hi': '',
    },
    'cpqastld': {
      'en': 'Turn this on for guests to start booking your listing.',
      'hi': '',
    },
    'dskcpdsn': {
      'en': 'STEP',
      'hi': '',
    },
    'yhxbusw8': {
      'en': '3/3',
      'hi': '',
    },
    'gp9vb7fp': {
      'en': 'Save Changes',
      'hi': '',
    },
    'kcoujasg': {
      'en': 'Home',
      'hi': '',
    },
  },
  // bottomSheet
  {
    '6y4kkxcj': {
      'en': 'Session Booked!',
      'hi': '',
    },
    '1b1q3kos': {
      'en': 'You have successfully booked a session on:',
      'hi': '',
    },
    'jhtxvoav': {
      'en': 'Mon, Dec 11 - 2021',
      'hi': '',
    },
  },
  // total
  {
    '4ry7e7w6': {
      'en': 'Order Total',
      'hi': '',
    },
    '80inva67': {
      'en':
          'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
      'hi': '',
    },
    'f2v0cyab': {
      'en': 'Okay',
      'hi': '',
    },
  },
  // changePhoto
  {
    '5q1vqwjh': {
      'en': 'Change Profile Photo',
      'hi': '',
    },
    '1r7lgcz7': {
      'en': 'Upload Photo',
      'hi': '',
    },
    '8fx9b7e6': {
      'en': 'Save Photo',
      'hi': '',
    },
  },
  // reviewTrip
  {
    'fi6poxpx': {
      'en': 'Rate Your Trip',
      'hi': '',
    },
    '8i4lqg52': {
      'en': 'Let us know what you thought of the place below!',
      'hi': '',
    },
    'o1b5forr': {
      'en': 'How would you rate it?',
      'hi': '',
    },
    '6ump1g8r': {
      'en': 'Please leave a description of the place...',
      'hi': '',
    },
    '48aejy0f': {
      'en': 'Submit Review',
      'hi': '',
    },
  },
  // changeMainPhoto
  {
    'y0bjp64y': {
      'en': 'Change Main Photo',
      'hi': '',
    },
    'p86x893k': {
      'en': 'Upload Photo',
      'hi': '',
    },
    'z464v4az': {
      'en': 'Save Photo',
      'hi': '',
    },
  },
  // cancelTrip
  {
    '0qit0hpo': {
      'en': 'Cancel Trip',
      'hi': '',
    },
    '1g535xn1': {
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'hi': '',
    },
    '362n8wnz': {
      'en': 'Your reason for cancelling...',
      'hi': '',
    },
    '233g0r87': {
      'en': 'Yes, Cancel Trip',
      'hi': '',
    },
    'kpfz9a40': {
      'en': 'Never Mind',
      'hi': '',
    },
  },
  // cancelTripHOST
  {
    'd5seq6p6': {
      'en': 'Cancel Trip',
      'hi': '',
    },
    'yg0t567l': {
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'hi': '',
    },
    '34ieqcze': {
      'en': 'Your reason for cancelling...',
      'hi': '',
    },
    '5aqws48b': {
      'en': 'Yes, Cancel Trip',
      'hi': '',
    },
    'esxzrg6a': {
      'en': 'Never Mind',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    '26n3sn1t': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'hi':
          'चित्र या वीडियो लेने के लिए, इस ऐप को कैमरे तक पहुंचने की अनुमति की आवश्यकता होती है।',
    },
    'l9c1ii53': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'hi':
          'डेटा अपलोड करने के लिए, इस ऐप को फोटो लाइब्रेरी तक पहुंचने की अनुमति की आवश्यकता होती है।',
    },
    'zfpuxh27': {
      'en': '',
      'hi': '',
    },
    'fanngyav': {
      'en': '',
      'hi': '',
    },
    'uxak99q4': {
      'en': '',
      'hi': '',
    },
    '9oi381ne': {
      'en': '',
      'hi': '',
    },
    '3wrxjobo': {
      'en': '',
      'hi': '',
    },
    'esus2rwd': {
      'en': '',
      'hi': '',
    },
    'lo0bf4jj': {
      'en': '',
      'hi': '',
    },
    '9ytko3ef': {
      'en': '',
      'hi': '',
    },
    'tgw4m0ef': {
      'en': '',
      'hi': '',
    },
    '7o2h2j6o': {
      'en': '',
      'hi': '',
    },
    'crql4cvw': {
      'en': '',
      'hi': '',
    },
    '1yb0pbuy': {
      'en': '',
      'hi': '',
    },
    'znm5hhc9': {
      'en': '',
      'hi': '',
    },
    '2wnj0sof': {
      'en': '',
      'hi': '',
    },
    'booolf39': {
      'en': '',
      'hi': '',
    },
    'hl97eola': {
      'en': '',
      'hi': '',
    },
    'f73v936p': {
      'en': '',
      'hi': '',
    },
    'f99gt1px': {
      'en': '',
      'hi': '',
    },
    '4oapgyyz': {
      'en': '',
      'hi': '',
    },
    'wokwadx4': {
      'en': '',
      'hi': '',
    },
    'kakj8lzp': {
      'en': '',
      'hi': '',
    },
    '7ml2gju1': {
      'en': '',
      'hi': '',
    },
    '4debwh28': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
