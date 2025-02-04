import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.products,
        arguments: category.id,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 50.sp,
                ),
                imageUrl: category.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            category.name,
            style:
                getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
