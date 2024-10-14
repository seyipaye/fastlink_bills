// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../plan/plan.dart';

part 'discount.g.dart';

typedef Discounts = List<Discount>;

@JsonSerializable()
class Discount {
  String id;
  String recipient;
  String applicable_plan;
  bool valid;
  double max_price;
  int max_usage;
  String title;
  int usage_count;
  double percentage;
  DateTime expiry;
  DateTime created;
  DateTime modified;

  Discount({
    required this.id,
    required this.expiry,
    required this.created,
    required this.modified,
    required this.recipient,
    required this.applicable_plan,
    required this.valid,
    required this.max_price,
    required this.max_usage,
    required this.title,
    required this.usage_count,
    required this.percentage,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountToJson(this);

  static Discounts filter_discount({Discounts? discounts, required Plan plan}) {
    if (discounts == null) return [];

    final Discounts filtered_discounts = [];

    for (final discount in discounts) {
      // Check if discount is applicable to all plans
      if (discount.applicable_plan.contains('all')) {
        filtered_discounts.add(discount);
        continue;
      }

      // Check if discount is applicable to present plan
      final applicable_plans = discount.applicable_plan.split(',');

      for (final applicable_plan_tag in applicable_plans) {
        if (plan.tags.contains(applicable_plan_tag)) {
          filtered_discounts.add(discount);
          continue;
        }
      }
    }

    return filtered_discounts;
  }

  static bool is_available({Discounts? discounts, required String tag}) {
    if (discounts == null) return false;

    final Discounts filtered_discounts = [];

    for (final discount in discounts) {
      // Check if discount is applicable to all plans
      if (discount.applicable_plan.contains(tag)) {
        filtered_discounts.add(discount);
      }
    }
    return filtered_discounts.length > 0;
  }
}
