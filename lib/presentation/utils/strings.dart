import '../../main.dart';

const String stagingDomain = 'https://fastlink-dev.onrender.com';
//'http://0.0.0.0:4422';
const String liveDomain =
    'https://fastlink-mt6m.onrender.com'; //'http://0.0.0.0:4455';

const String stagingURL = "$stagingDomain/api/v1";
const String liveURL = '$liveDomain/api/v1';

class AppStrings {
  // static const String noRouteFound = "No Route Found";
  static String get baseUrl => appDebugMode.value ? stagingURL : liveURL;
  static String get baseDomain =>
      appDebugMode.value ? stagingDomain : liveDomain;
}

const String kUrl = 'https://picsum.photos/200/200';

const String kRaleway = 'Raleway400';
const String kRaleway500 = 'Raleway500';
const String kRaleway600 = 'Raleway600';

const String kMTNLogo = 'assets/images/mtn_logo.png';
const String kAirtelLogo = 'assets/images/airtel_logo.png';
const String kGloLogo = 'assets/images/glo_logo.png';
const String kNineMobile = 'assets/images/nine_mobile_logo.png';

const int kCripsExpiryTime = 1; // In hours

const String cripsID = '8f23541e-0518-4659-ba4f-7cda9aa5ac68';

const String googleMapsAPIKey = "AIzaSyB-_DDU0TQKu5wWEKybt1VkM-1VbXVIDl8";
