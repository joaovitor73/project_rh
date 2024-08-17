import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rh_project/data/bloc/member/member_bloc.dart';
import 'package:rh_project/data/bloc/member/member_event.dart';
import 'package:rh_project/data/bloc/member/member_state.dart';
import 'package:rh_project/data/model/member.dart';
import 'package:rh_project/data/repository/memberRepository.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  late final MemberBloc _memberBloc;

  @override
  void initState() {
    super.initState();
    _memberBloc = MemberBloc(memberRepository: MemberRepository()	);
    _memberBloc.add(getMember());
  }

  @override
  void dispose() {
    _memberBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
             _memberBloc.add(addMember(member: Member(name: 'Member 1', email: 'member1@gmail', password: '134567', phone: '1234567890', address: '123 Main St', role: 'User', status: 'Active')));
            },
          ),
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MemberBloc, MemberState>(
          bloc: _memberBloc,
          builder: (context, state) {
            if (state is memberLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is memberLoaded) {
              return ListView.builder(
                itemCount: state.members.length,
                itemBuilder: (context, index) {
                  final member = state.members[index];
                  return ListTile(
                    title: Text(member.name),
                    subtitle: Text(member.email),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _memberBloc.add(deleteMember(member: member));
                      },
                    ),
                  );
                },
              );
            } else if (state is memberError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}