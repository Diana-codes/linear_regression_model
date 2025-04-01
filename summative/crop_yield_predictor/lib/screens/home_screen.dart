import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/prediction_input.dart';
import '../services/api_service.dart';
import 'result_screen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final PredictionInput _input = PredictionInput(
    rainfall: 0,
    temperature: 0,
    soilType: 0,
    fertilizerUsed: false,
    irrigationUsed: false,
    weatherCondition: 0,
    region: 0,
  );

  final List<String> soilTypes = ['Sandy', 'Clay', 'Loam', 'Silt'];
  final List<String> weatherConditions = ['Sunny', 'Rainy', 'Cloudy'];
  final List<String> regions = ['North', 'South', 'East', 'West'];

  bool _isLoading = false;
  final _defaultPadding = 20.0;

  Future<void> _predictYield() async {
    if (!_formKey.currentState!.validate()) return;
    
    _formKey.currentState!.save();
    setState(() => _isLoading = true);

    try {
      final prediction = await ApiService.predictYield(_input)
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(prediction: prediction),
        ),
      );
    } on TimeoutException catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request timed out. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crop Yield Predictor',
          style: theme.textTheme.titleLarge?.copyWith(color: colors.onPrimary),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colors.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colors.surfaceVariant, theme.scaffoldBackgroundColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(theme),
                  const SizedBox(height: 20),
                  _buildInputCard(context),
                  const SizedBox(height: 25),
                  _buildPredictButton(theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      children: [
        Icon(
          FontAwesomeIcons.wheatAwn,
          size: 50,
          color: Colors.amber[700],
        ),
        const SizedBox(height: 10),
        Text(
          'Optimize Your Harvest',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Enter agricultural parameters to predict crop yield',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildInputCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildInputField(
              context: context,
              label: 'Rainfall (mm)',
              icon: FontAwesomeIcons.cloudRain,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Required';
                final num = double.tryParse(value!);
                if (num == null) return 'Enter valid number';
                if (num < 0) return 'Must be positive';
                return null;
              },
              onSaved: (value) => _input.rainfall = double.tryParse(value ?? '0') ?? 0,
            ),
            const SizedBox(height: 15),
            _buildInputField(
              context: context,
              label: 'Temperature (°C)',
              icon: FontAwesomeIcons.temperatureHigh,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Required';
                final num = double.tryParse(value!);
                if (num == null) return 'Enter valid number';
                if (num < -20 || num > 50) return 'Invalid range (-20 to 50)';
                return null;
              },
              onSaved: (value) => _input.temperature = double.tryParse(value ?? '0') ?? 0,
            ),
            const SizedBox(height: 15),
            _buildDropdown(
              context: context,
              label: 'Soil Type',
              icon: FontAwesomeIcons.seedling,
              value: _input.soilType,
              items: soilTypes,
              onChanged: (value) => setState(() => _input.soilType = value ?? 0),
            ),
            const SizedBox(height: 15),
            _buildDropdown(
              context: context,
              label: 'Weather Condition',
              icon: FontAwesomeIcons.cloudSun,
              value: _input.weatherCondition,
              items: weatherConditions,
              onChanged: (value) => setState(() => _input.weatherCondition = value ?? 0),
            ),
            const SizedBox(height: 15),
            _buildDropdown(
              context: context,
              label: 'Region',
              icon: FontAwesomeIcons.globeAsia,
              value: _input.region,
              items: regions,
              onChanged: (value) => setState(() => _input.region = value ?? 0),
            ),
            const SizedBox(height: 15),
            _buildSwitchTile(
              context: context,
              title: 'Fertilizer Used',
              icon: FontAwesomeIcons.flask,
              value: _input.fertilizerUsed,
              onChanged: (value) => setState(() => _input.fertilizerUsed = value ?? false),
            ),
            _buildSwitchTile(
              context: context,
              title: 'Irrigation Used',
              icon: FontAwesomeIcons.tint,
              value: _input.irrigationUsed,
              onChanged: (value) => setState(() => _input.irrigationUsed = value ?? false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required String label,
    required IconData icon,
    required FormFieldValidator<String?> validator,
    required FormFieldSetter<String?> onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required String label,
    required IconData icon,
    required int value,
    required List<String> items,
    required ValueChanged<int?> onChanged,
  }) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        border: const OutlineInputBorder(),
      ),
      value: value,
      items: items
          .asMap()
          .entries
          .map((e) => DropdownMenuItem(
                value: e.key,
                child: Text(e.value),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildSwitchTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildPredictButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: _isLoading ? null : _predictYield,
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                'PREDICT YIELD',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}