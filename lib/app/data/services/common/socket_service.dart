import 'package:injectable/injectable.dart';
import 'package:mymanislier/app/utils/helpers/injectable/injectable.dart';

@lazySingleton
@injectable
class SocketService {
  void init() {
    //
    getIt.resetLazySingleton<SocketService>();
  }
}
