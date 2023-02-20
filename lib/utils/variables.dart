import 'package:flutter/material.dart';
import '../../utils/constants.dart';

List<List<InlineSpan>> infoSpanList = [
  [
    TextSpan(text: 'Ishonchli ', style: kOnboardingInfoTextStyle.copyWith(color: kPrimaryColor)),
    const TextSpan(text: 'haydovchilar xizmatidan foydalaning!'),
  ],
  [
    const TextSpan(text: 'Bizda barcha haydovchilar '),
    TextSpan(text: 'ayollardan ', style: kOnboardingInfoTextStyle.copyWith(color: kPrimaryColor)),
    const TextSpan(text: 'iborat'),
  ],
  [
    const TextSpan(text: 'Ayollar va bolalar uchun  '),
    TextSpan(text: 'xavfsiz  ', style: kOnboardingInfoTextStyle.copyWith(color: kPrimaryColor)),
    const TextSpan(text: 'taksi xizmati'),
  ],
];
