import 'package:rh_project/data/model/member.dart';

abstract class MemberState{
  final List<Member> members;
  MemberState({required this.members});
}

class memberInitial extends MemberState{
  memberInitial():super(members: []);
}
class memberLoading extends MemberState{
  memberLoading():super(members: []);
}
class memberLoaded extends MemberState{
  memberLoaded({required List<Member> members}):super(members: members);
}

class memberError extends MemberState{
  final String message;
  memberError({required this.message}):super(members: []);
}


