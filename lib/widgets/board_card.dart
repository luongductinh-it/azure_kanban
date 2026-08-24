import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/models/board_model.dart';
import 'package:flutter/material.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({super.key, this.board});

  final BoardModel? board;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColor.greyC3.withValues(alpha: 0.15))],
      ),
      child: Stack(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Color(
                board?.backgroundColorValue ?? AppColor.green00.value,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      board?.name ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black19,
                      ),
                    ),
                    Icon(Icons.star_rounded, color: AppColor.primaryColor),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  board?.decriptions ?? "",
                  style: TextStyle(color: AppColor.black43),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAvatarStack(),
                    Spacer(),
                    Icon(
                      Icons.check_circle_outline,
                      size: 12,
                      color: AppColor.black43.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 4),
                    Text('12'),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 12,
                      color: AppColor.black43.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 4),
                    Text('12'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      height: 32,
      width: 100,
      child: Stack(
        children: [
          for (var i = 0; i < 3; i++)
            Positioned(left: i * 20, child: CircleAvatar(radius: 16)),
          Positioned(
            left: 60,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200],
              child: Text(
                '+2',
                style: TextStyle(color: AppColor.black43, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
