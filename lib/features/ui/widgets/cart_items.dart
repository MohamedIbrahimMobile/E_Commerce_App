import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    this.variant,
    this.onRemove,
  });

  final ImageProvider<Object> image;
  final String name;
  final String price;
  final int quantity;
  final String? variant;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary30Opacity),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 96,
              height: 112,
              child: Image(image: image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppStyles.regular14Text.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (onRemove != null)
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 32,
                          height: 32,
                        ),
                        tooltip: 'Remove item',
                        onPressed: onRemove,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: AppColors.redColor,
                          size: 20,
                        ),
                      ),
                  ],
                ),
                if (variant != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    variant!,
                    style: AppStyles.regular12Text.copyWith(
                      color: AppColors.searchHintColor,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  price,
                  style: AppStyles.regular14Text.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: _QuantityControl(
                    quantity: quantity,
                    onIncrease: onIncrease,
                    onDecrease: onDecrease,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  const _QuantityControl({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary30Opacity),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: Icons.remove,
            tooltip: 'Decrease quantity',
            onPressed: onDecrease,
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppStyles.regular14Text,
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            tooltip: 'Increase quantity',
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(width: 32, height: 32),
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: AppColors.primaryColor),
    );
  }
}
