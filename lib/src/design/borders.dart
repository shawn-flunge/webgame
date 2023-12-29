



import 'package:flutter/material.dart';
import 'package:webgame/src/design/colors.dart';

const negativeBorder = BoxDecoration(
    border: Border(
      top: BorderSide(
          width: 2,
          color: AppColors.darkGrey
      ),
      left: BorderSide(
          width: 2,
          color: AppColors.darkGrey
      ),
      right: BorderSide(
          width: 2,
          color: AppColors.borderWhite
      ),
      bottom: BorderSide(
          width: 2,
          color: AppColors.borderWhite
      ),
    )
);

const positiveBorder = BoxDecoration(
    color: AppColors.grey,
    border: Border(
      top: BorderSide(
          color: AppColors.borderWhite,
          width: 2
      ),
      left: BorderSide(
          color: AppColors.borderWhite,
          width: 2
      ),
      bottom: BorderSide(
          color: AppColors.black,
          width: 2
      ),
      right: BorderSide(
          color: AppColors.black,
          width: 2
      ),

    )
);