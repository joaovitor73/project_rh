import 'package:rh_project/data/model/member.dart';

abstract class MemberEvent {

}

class addMember extends MemberEvent{
  final Member member;
  addMember({required this.member});
}

class updateMember extends MemberEvent{
  final Member member;
  updateMember({required this.member});
}

class deleteMember extends MemberEvent{
  final Member member;
  deleteMember({required this.member});
}

class getMember extends MemberEvent{
  getMember();
}