import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/core/routes/navigation_service.dart';
import 'package:to_do_list_squad/src/to_do_list/data/repositories/to_do_repository_impl.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/usecases/get_list_to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/usecases/set_list_to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/provider/to_do_state.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(NavigationService());

  locator.registerSingleton<ToDoRepository>(
    ToDoRepositoryImpl(),
  );

  locator.registerSingleton<ToDoState>(ToDoState());

  locator.registerSingleton<GetListToDoUseCase>(
    GetListToDoUseCase(),
  );

  locator.registerSingleton<SetListToDoUseCase>(
    SetListToDoUseCase(),
  );
}
