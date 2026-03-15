import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/user_ds.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/user_ds_impl.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/create_collection_usecase.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/get_user_usecase.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/set_user_usecase.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_event.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_state.dart';
@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  GetUserUsecase getUserUsecase;
  SetUserUsecase setUserUsecase;
 UserDs userDs;
  CreateCollectionUsecase collectionUsecase;
  UserBloc(this.userDs,this.setUserUsecase , this.collectionUsecase, this.getUserUsecase) : super(UserState()){
    on<craateCollec>((event, emit)async {{
      try{
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));
await    collectionUsecase.call();

        emit(state.copyWith(getMoviesStatus: RequestStatus.success));

      }catch(e){

        emit(state.copyWith(getMoviesStatus: RequestStatus.error,errorMassage: e.toString()));
      }

    }});
    on<getUser>((event, emit) async {{
      try{
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));
        var res =     getUserUsecase.call();

        emit(state.copyWith(getMoviesStatus: RequestStatus.success,userModel:  await res));

      }catch(e){

        emit(state.copyWith(getMoviesStatus: RequestStatus.error,errorMassage: e.toString()));
      }

    }});
    on<setUser>((event, emit) async {
      try {
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));
        await setUserUsecase.call(event.userModel);
        emit(state.copyWith(getMoviesStatus: RequestStatus.success, userModel: event.userModel));
      } catch (e) {
        emit(state.copyWith(getMoviesStatus: RequestStatus.error, errorMassage: e.toString()));
      }
    });
    on<upDateUser> ((event, emit){

      emit(state.copyWith(getMoviesStatus:  RequestStatus.loading));

      try{
       var collec =  userDs.CreateCollectionUSer();
       var ref = collec.doc(event.userModel.id);
        ref.update(event.userModel.tojson());
       emit(state.copyWith(getMoviesStatus:  RequestStatus.success));

      }catch(e){
        emit(state.copyWith(getMoviesStatus:  RequestStatus.error,errorMassage: e.toString()));

      }

    });
    on<logOutEvent>((event, emit){
      emit(state.copyWith(getMoviesStatus: RequestStatus.loading));
   try{
     userDs.logOut();
     emit(state.copyWith(getMoviesStatus: RequestStatus.success));
   }catch(e){
     emit(state.copyWith(getMoviesStatus: RequestStatus.error, errorMassage: e.toString()));
   }
    });
  }

 }
