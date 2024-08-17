import 'package:rh_project/data/model/member.dart';

class MemberRepository{
  final List<Member> members = [];

  Future<List<Member>> getMember() async{
    members.add(Member(name: 'John Doe', email: 'john@gmail.com', password: '123456', phone: '1234567890', address: '123 Main St', role: 'Admin', status: 'Active'));
    members.add(Member(name: 'Jane Doe', email: 'jane@gmail.com', password	: '123456', phone: '1234567890', address: '123 Main St', role: 'User', status: 'Active'));
    members.add(Member(name: 'John Smith', email: 'smith@gmail.com', password : '123456', phone: '1234567890', address: '123 Main St', role: 'User', status: 'Active'));
    await Future.delayed(const Duration(seconds: 1));
    return members;
  }

  Future<List<Member>> addMember(Member member) async{
    members.add(member);
    await Future.delayed(const Duration(seconds: 1));
    return	members;
  }

  Future<List<Member>> updateMember(Member member) async{
    final index = members.indexWhere((element) => element.email == member.email);
    members[index] = member;
    await Future.delayed(const Duration(seconds: 1));
     return	members;
  }

  Future<List<Member>> deleteMember(Member member) async{
    members.removeWhere((element) => element.email == member.email);
    await Future.delayed(const Duration(seconds: 1));
    return	members;
  }
}