import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rh_project/data/bloc/member/member_event.dart';
import 'package:rh_project/data/bloc/member/member_state.dart';
import 'package:rh_project/data/model/member.dart';
import 'package:rh_project/data/repository/memberRepository.dart';
class MemberBloc extends Bloc<MemberEvent, MemberState>{
  final MemberRepository memberRepository;

  MemberBloc({required this.memberRepository}) : super(memberInitial()){ 
    on<addMember>((event, emit) async {
      emit(memberLoading());
      try{
        final members = await memberRepository.addMember(event.member);
        emit(memberLoaded(members: members));
      }catch(e){
        emit(memberError(message: e.toString()));
      }
    });

    on<updateMember>((event, emit) async {
      emit(memberLoading());
      try{
        final members = await memberRepository.updateMember(event.member);
        emit(memberLoaded(members: members));
      }catch(e){
        emit(memberError(message: e.toString()));
      }
    });

    on<deleteMember>((event, emit) async {
      emit(memberLoading());
      try{
        final members = await memberRepository.deleteMember(event.member);
        emit(memberLoaded(members: members));
      }catch(e){
        emit(memberError(message: e.toString()));
      }
    });

    on<getMember>((event, emit) async {
      emit(memberLoading());
      try{
        final members = await memberRepository.getMember();
        emit(memberLoaded(members: members));
      }catch(e){
        emit(memberError(message: e.toString()));
      }
    });
  }
}