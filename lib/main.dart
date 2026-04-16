import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 라우팅 설정 파일 import
import 'package:second_trip_project/screen/RoutingScreen.dart';

// 각 팀원 컨트롤러 import
import 'package:second_trip_project/package/controller/package_controller.dart';
import 'package:second_trip_project/car/controller/calendar_controller.dart';
import 'package:second_trip_project/car/controller/rent_comp_controller.dart';

// [필수] 컨트롤러 클래스 정의 (각 파일에 extends ChangeNotifier가 꼭 있어야 합니다)
// 여기에 직접 정의하거나, 각 파일에서 ChangeNotifier를 상속받았는지 확인하세요.

class PackageController extends ChangeNotifier {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(
    // 1. MultiProvider를 최상단에 배치하여 모든 화면이 데이터를 공유하게 합니다.
    MultiProvider(
      providers: [
        // 진주님 패키지 데이터
        ChangeNotifierProvider<PackageController>(create: (_) => PackageController()),
        // 태흔님 렌터카 데이터 (업체 및 달력)
        ChangeNotifierProvider<RentCompController>(create: (_) => RentCompController()),
        ChangeNotifierProvider<CalendarController>(create: (_) => CalendarController()),
      ],
      // 2. 성규님의 라우팅 설정이 담긴 RoutingScreen을 실행합니다.
      child: const RoutingScreen(),
    ),
  );
}