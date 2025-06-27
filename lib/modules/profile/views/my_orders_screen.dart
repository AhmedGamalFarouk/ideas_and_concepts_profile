import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_and_concepts_profile/core/constants/app_colors.dart';
import 'package:ideas_and_concepts_profile/core/constants/firebase_constants.dart';
import 'package:ideas_and_concepts_profile/core/widgets/order_card_widget.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(color: AppColors.textBlack),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Fetching the dummy orders subcollection
        stream: FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseConstants.testUserId)
            .collection(FirebaseConstants.ordersCollection)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('You have no orders.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final order =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              final date = (order['date'] as Timestamp).toDate();
              final formattedDate = DateFormat('MMMM dd').format(date);
              final status = order['status'] ?? 'Delivered';

              return Column(
                children: [
                  OrderCardWidget(
                    status: status,
                    formattedDate: formattedDate,
                    order: order,
                  ),
                  OrderCardWidget(
                    status: status,
                    formattedDate: formattedDate,
                    order: order,
                  ),
                  OrderCardWidget(
                    status: status,
                    formattedDate: formattedDate,
                    order: order,
                  ),
                  OrderCardWidget(
                    status: status,
                    formattedDate: formattedDate,
                    order: order,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
