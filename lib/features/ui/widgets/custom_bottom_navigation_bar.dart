import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const List<_BottomNavItem> _items = [
    _BottomNavItem(
      label: 'Home',
      selectedAsset: AppAssets.selectedHomeIcon,
      unselectedAsset: AppAssets.unSelectedHomeIcon,
    ),
    _BottomNavItem(
      label: 'Categories',
      selectedAsset: AppAssets.selectedCategoryIcon,
      unselectedAsset: AppAssets.unSelectedCategoryIcon,
    ),
    _BottomNavItem(
      label: 'Wishlist',
      selectedAsset: AppAssets.selectedFavouriteIcon,
      unselectedAsset: AppAssets.unSelectedFavouriteIcon,
    ),
    _BottomNavItem(
      label: 'Account',
      selectedAsset: AppAssets.selectedAccountIcon,
      unselectedAsset: AppAssets.unSelectedAccountIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 64,
        color: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == selectedIndex;

            return Expanded(
              child: Semantics(
                button: true,
                selected: isSelected,
                label: item.label,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => onTap(index),
                  child: Center(
                    child: Image.asset(
                      isSelected ? item.selectedAsset : item.unselectedAsset,
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.circle_outlined,
                        size: 24,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavItem {
  const _BottomNavItem({
    required this.label,
    required this.selectedAsset,
    required this.unselectedAsset,
  });

  final String label;
  final String selectedAsset;
  final String unselectedAsset;
}
