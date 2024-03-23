import 'package:cloudwalk_weather_test/core/components/colors/custom_color.dart';
import 'package:flutter/material.dart';

import '../../../weather/domain/constants/main_cities_list.dart';
import '../../../weather/domain/entity/city_entity.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    super.key,
    required this.onSelected,
  });

  final ValueChanged<CityEntity> onSelected;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewBackgroundColor: CustomColor.defaultWhite,
      viewSurfaceTintColor: CustomColor.defaultWhite,
      isFullScreen: false,
      builder: (context, controller) => SearchBar(
        hintText: 'Search for a city',
        controller: controller,
        onTap: () {
          controller.openView();
        },
        elevation: const MaterialStatePropertyAll<double>(
          0,
        ),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          CustomColor.defaultWhite,
        ),
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: CustomColor.defaultBlack,
            ),
          ),
        ),
        trailing: const [Icon(Icons.search)],
        onChanged: (_) {
          controller.openView();
        },
      ),
      suggestionsBuilder: (context, controller) {
        List<CityEntity> suggestions = MainCities.list;
        if (controller.text.isEmpty) {
          suggestions = MainCities.list;
        }

        return List<CityEntity>.from(suggestions).map(
          (city) {
            bool display =
                city.name.toLowerCase().contains(controller.text.toLowerCase());
            return Visibility(
              visible: display,
              child: ListTile(
                title: Text(
                  city.name,
                ),
                onTap: () {
                  onSelected.call(city);
                  controller.closeView(city.name);
                },
              ),
            );
          },
        ).toList();
      },
    );
  }
}
