import 'package:azure_kanban/boards/bloc/boards_bloc.dart';
import 'package:azure_kanban/boards/bloc/boards_event.dart';
import 'package:azure_kanban/boards/bloc/boards_state.dart';
import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/models/board_model.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:azure_kanban/widgets/app_text_form_field.dart';
import 'package:azure_kanban/widgets/board_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardsScreen extends StatelessWidget {
  const BoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Azure Kanban",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        actions: [CircleAvatar(radius: 20), const SizedBox(width: 40)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(context),
            const SizedBox(height: 16),
            _actionButton(context),
            const SizedBox(height: 16),
            _sectionHeader(),
            const SizedBox(height: 25),
            _listBoards(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return AppTextFormField(
      hintText: "Search your boards...",
      prefixIcon: Icon(Icons.search),
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      onChanged: (value) {
        context.read<BoardsBloc>().add(SearchBoards(searchName: value));
      },
    );
  }

  Widget _actionButton(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.filter_list, size: 18),
          label: Text(
            'Filter',
            style: TextStyle(color: AppColor.black43, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.greyE7,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          height: 40,
          width: 150,
          child: AppButton(
            title: 'New Board',
            color: AppColor.primaryColor,
            hasIcon: false,
            leftIcon: Icon(Icons.add, color: Colors.white),
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            onPressed: () async {
              final created = await Navigator.pushNamed(
                context,
                RouteNames.createBoard,
              );
              if (created == true) {
                context.read<BoardsBloc>().add(
                  LoadBoards(
                    userId: FirebaseAuth.instance.currentUser?.uid ?? "",
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader() {
    return Text(
      'Current Boards',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black19,
      ),
    );
  }

  Widget _listBoards() {
    return BlocBuilder<BoardsBloc, BoardsState>(
      builder: (context, state) {
        if (state is BoardsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BoardsLoaded) {
          if (state.boards.isEmpty) {
            return Center(child: const Text('No boards found.'));
          }
          return Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => BoardCard(board: state.boards[index]),
              separatorBuilder: (_, index) => SizedBox(height: 24),
              itemCount: state.boards.length,
            ),
          );
        } else if (state is BoardsError) {
          return Center(child: Text('Error : ${state.message}'));
        }
        return SizedBox();
      },
    );
  }
}
