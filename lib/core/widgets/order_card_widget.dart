import 'package:flutter/material.dart';
import 'package:ideas_and_concepts_profile/core/constants/app_colors.dart';

class OrderCardWidget extends StatelessWidget {
  final String status;
  final String formattedDate;
  final Map<String, dynamic> order;

  const OrderCardWidget({
    super.key,
    required this.status,
    required this.formattedDate,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order: $status',
                  style: TextStyle(
                    color: status == 'Canceled' ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(color: AppColors.grey),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        order['imageUrl'] ?? 'https://via.placeholder.com/150',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name'] ?? 'Item Name',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order['description'] ?? 'No description available.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${order['price']?.toStringAsFixed(2) ?? '0.00'}',
                          ),
                          Text('${order['quantity'] ?? 1}x uds.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total: \$${(order['price'] * order['quantity'])?.toStringAsFixed(2) ?? '0.00'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
