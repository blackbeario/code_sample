part of 'ad_template_cubit.dart';

class AdTemplateState extends Equatable {
  AdTemplateState({
    required this.title,
    required this.type,
    this.scheduleStart,
    this.scheduleEnd,
    required this.locations,
    this.marketId,
    this.marketAreaIds,
    this.deletedMarketAreaIds,
    this.marketAreaSchoolId,
    required this.segments,
    required this.duration,
    required this.continuous,
    required this.adCost,
    this.advertisementId,
    this.submitted,
    this.selectedClubName,
    this.selectedClubId,
  });

  final String title;
  final String type;
  final DateTime? scheduleStart;
  final DateTime? scheduleEnd;
  final List<String> locations;
  final String? marketId;
  final List<String>? marketAreaIds;
  final List<String>? deletedMarketAreaIds;
  final String? marketAreaSchoolId;
  final List<String> segments;
  final double duration;
  final bool continuous;
  final int adCost;
  final String? advertisementId;
  final bool? submitted;
  final String? selectedClubName;
  final String? selectedClubId;

  @override
  List<Object> get props => [
        title,
        type,
        scheduleStart!,
        scheduleEnd!,
        locations,
        segments,
        duration,
        continuous,
        adCost,
        advertisementId!,
        marketId!,
        marketAreaIds!,
        deletedMarketAreaIds!,
        marketAreaSchoolId!,
        submitted!,
        selectedClubName!,
        selectedClubId!,
      ];

  AdTemplateState copyWith({
    String? title,
    String? type,
    DateTime? scheduleStart,
    DateTime? scheduleEnd,
    List<String>? locations,
    List<String>? segments,
    double? duration,
    bool? continuous,
    int? adCost,
    String? advertisementId,
    String? marketId,
    List<String>? marketAreaIds,
    List<String>? deletedMarketAreaIds,
    String? marketAreaSchoolId,
    bool? submitted,
    String? selectedClubName,
    String? selectedClubId,
  }) =>
      AdTemplateState(
        title: title ?? this.title,
        type: type ?? this.type,
        scheduleStart: scheduleStart ?? this.scheduleStart,
        scheduleEnd: scheduleEnd ?? this.scheduleEnd,
        locations: locations ?? this.locations,
        segments: segments ?? this.segments,
        duration: duration ?? this.duration,
        continuous: continuous ?? this.continuous,
        adCost: adCost ?? this.adCost,
        advertisementId: advertisementId ?? this.advertisementId,
        marketId: marketId ?? this.marketId,
        marketAreaIds: marketAreaIds ?? this.marketAreaIds,
        deletedMarketAreaIds: deletedMarketAreaIds ?? this.deletedMarketAreaIds,
        marketAreaSchoolId: marketAreaSchoolId ?? this.marketAreaSchoolId,
        submitted: submitted ?? this.submitted,
        selectedClubId: selectedClubId ?? this.selectedClubId,
        selectedClubName: selectedClubName ?? this.selectedClubName,
      );
}

class AdTemplateInitial extends AdTemplateState {
  AdTemplateInitial()
      : super(
          title: '',
          type: '',
          scheduleStart: DateTime.now(),
          scheduleEnd: DateTime.now(),
          locations: [],
          segments: [],
          duration: 7.5,
          continuous: true,
          adCost: 1,
          advertisementId: '',
          marketId: '',
          marketAreaIds: [],
          deletedMarketAreaIds: [],
          marketAreaSchoolId: '',
          submitted: false,
          selectedClubId: '',
          selectedClubName: '',
        );
}
