import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/resources/image&icon.dart';
import 'package:movie_c17_me/features/edit_profile/domain/usecase/update_user_usecase.dart';
import 'package:movie_c17_me/features/edit_profile/presetation/bloc/update_user_event.dart';
import 'package:movie_c17_me/features/edit_profile/presetation/bloc/update_user_state.dart';
@injectable
class UpdateUserBloc  extends Bloc<UpdateUserEvent, UpdateUserState>{
  UpdateUserUsecase updateUserUsecase;
  UpdateUserBloc(this.updateUserUsecase): super(UpdateUserState()){
   state.avtar=[ImageApp.byProfile,ImageApp.byProfile2,ImageApp.byProfile3,ImageApp.byProfile4,ImageApp.byProfile5,ImageApp.byProfile6,ImageApp.byProfile7,ImageApp.byProfile8,ImageApp.byProfile9, ];
    on<UpdateUser>((event, emit)async{
      try{
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));
 await  updateUserUsecase.call(event.userModel);
      emit(state.copyWith(getMoviesStatus: RequestStatus.success,userModel: event.userModel));

      }catch(e){
        emit(state.copyWith(getMoviesStatus: RequestStatus.error,errorMassage: e.toString(),));
      }
    });
    on<ChangeAvatr>((event, emit){
      emit(state.copyWith(selectedAvatar: event.selectedIndex, avtar: state.avtar));

    });
  }
}