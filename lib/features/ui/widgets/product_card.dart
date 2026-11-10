import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_badge.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discountLabel,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
    this.imageHeight = 140,
  });

  final ImageProvider<Object> image;
  final String name;
  final String price;
  final String? oldPrice;
  final String? discountLabel;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary30Opacity),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(image: image, fit: BoxFit.cover),
                    if (discountLabel != null)
                      PositionedDirectional(
                        top: 8,
                        start: 8,
                        child: CustomBadge(
                          text: discountLabel!,
                          backgroundColor: AppColors.yellowColor,
                          textColor: AppColors.primaryDark,
                        ),
                      ),
                    if (onFavoriteTap != null)
                      PositionedDirectional(
                        top: 6,
                        end: 6,
                        child: Material(
                          color: AppColors.whiteColor.withValues(alpha: 0.9),
                          shape: const CircleBorder(),
                          child: IconButton(
                            tooltip: isFavorite
                                ? 'Remove from wishlist'
                                : 'Add to wishlist',
                            onPressed: onFavoriteTap,
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? AppColors.lightRedColor
                                  : AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppStyles.regular14Text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                price,
                                style: AppStyles.regular12Text.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (oldPrice != null)
                                Text(
                                  oldPrice!,
                                  style: AppStyles.regular11SalePrice.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.searchHintColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (onAddToCart != null)
                          IconButton(
                            tooltip: 'Add to cart',
                            onPressed: onAddToCart,
                            visualDensity: VisualDensity.compact,
                            constraints: const BoxConstraints.tightFor(
                              width: 36,
                              height: 36,
                            ),
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add_shopping_cart_outlined,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
