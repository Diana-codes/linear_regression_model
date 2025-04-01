class PredictionInput {
  double rainfall;
  double temperature;
  int soilType;
  bool fertilizerUsed;
  bool irrigationUsed;
  int weatherCondition;
  int region;

  PredictionInput({
    required this.rainfall,
    required this.temperature,
    required this.soilType,
    required this.fertilizerUsed,
    required this.irrigationUsed,
    required this.weatherCondition,
    required this.region,
  });

  Map<String, dynamic> toJson() => {
    'Rainfall_mm': rainfall,
    'Temperature_Celsius': temperature,
    'Soil_Type': soilType,
    'Fertilizer_Used': fertilizerUsed ? 1 : 0,
    'Irrigation_Used': irrigationUsed ? 1 : 0,
    'Weather_Condition': weatherCondition,
    'Region': region,
  };
}