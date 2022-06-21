import '../graphQueries.dart';
import '../models/advertisement.dart';

part 'ad_template_state.dart';

class AdTemplateCubit extends Cubit<AdTemplateState> {
  AdTemplateCubit() : super(AdTemplateInitial());

  /// Assorted simple methods to set state in the UI
  void setSubmitted(bool value) => emit(state.copyWith(submitted: value));
  void setSelectedClub(club) => emit(state.copyWith(selectedClubName: club['name'], selectedClubId: club['id']));
  void setAdType(String type) => emit(state.copyWith(type: type));
  void setAdScheduleStart(DateTime? scheduleStart) => emit(state.copyWith(scheduleStart: scheduleStart));
  void setAdScheduleEnd(DateTime? scheduleEnd) => emit(state.copyWith(scheduleEnd: scheduleEnd));
  void clearMarkets() => emit(state.copyWith(marketId: '', marketAreaIds: [], locations: [], selectedClubId: '', selectedClubName: ''));
  void setMarketId(String id) => emit(state.copyWith(marketId: id));
  void setMarketAreaSchoolId(String id) => emit(state.copyWith(marketAreaSchoolId: id));

  /// Conditional logic before setting state
  void setAdLocation(String location) {
    List<String> locationList = [];
    state.locations.forEach((element) => locationList.add(element));
    if (locationList.contains(location))
      locationList.remove(location);
    else
      locationList.add(location);
    emit(state.copyWith(locations: locationList));
  }

  /// This is a GraphQL query to fetch an advertisement from AWS.
  /// See graphQueries.dart
  getAdvertisementById(
    BuildContext context,
    String id,
  ) async {
    final QueryResult result = await GraphQLProvider.of(context).value.query(QueryOptions(
          document: gql(getAdvertisement),
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {'id': id},
        ));
    if (result.hasException) print(result.exception.toString());
    if (result.data != null) {
      // This passes the data from the query to our Advertisement model so we
      // can more easily use strong typed data with sound null safety
      Advertisement ad = Advertisement.fromJson(result.data!['getAdvertisement']);
      List<String> selectedMarketAreaNames = [];
      List<String> selectedMarketAreaIds = [];
      if (ad.marketAreas != null && ad.marketAreas!.isNotEmpty) {
        for (var marketArea in ad.marketAreas!) {
          selectedMarketAreaNames.add(marketArea.name!);
          selectedMarketAreaIds.add(marketArea.id!);
        }
      }
      emit(state.copyWith(marketAreaIds: selectedMarketAreaIds));
      return ad;
    }
  }

  resetValues() => emit(AdTemplateInitial());
}
