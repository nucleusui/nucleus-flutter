import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/countries.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/input_field.dart';
import 'package:nucleus_ui/src/search_field.dart';

/// A customizable mobile number input component with country code selection.
///
/// The MobileNumber widget provides a specialized input field for mobile numbers
/// with an integrated country picker. It automatically validates phone number
/// length based on the selected country and provides customizable formatting
/// and validation options.
///
/// Features:
/// - Country code selection with flag display
/// - Automatic phone number validation based on country
/// - Customizable input formatters and validators
/// - Built-in country picker dialog with search functionality
/// - Error state handling and visual feedback
class MobileNumber extends StatefulWidget {
  const MobileNumber({
    super.key,
    this.labelText,
    this.hintText,
    this.validator,
    this.inputFormatters,
    this.textInputType = TextInputType.phone,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.prefixWidget,
    this.dialogTitle = 'Select Country',
    this.searchHint = 'Search by country name, code, or dial code',
    this.controller,
    this.prefixPadding = const EdgeInsets.only(left: 16, right: 5),
    this.onCountrySelected,
    this.isError = false,
    this.isEnabled = true,
  });

  /// The label text displayed above the input field.
  final String? labelText;

  /// The hint text displayed inside the input field when empty.
  final String? hintText;

  /// Custom validator function for the mobile number input.
  /// If null, uses default validation based on selected country.
  final String? Function(String?)? validator;

  /// Custom input formatters for the mobile number input.
  /// If null, uses digits-only formatter with country-based length limiting.
  final List<TextInputFormatter>? inputFormatters;

  /// The keyboard type for the input field.
  /// Defaults to TextInputType.phone.
  final TextInputType textInputType;

  /// When to automatically validate the input.
  /// Defaults to AutovalidateMode.onUserInteraction.
  final AutovalidateMode? autovalidateMode;

  /// Custom prefix widget to display before the country selector.
  final Widget? prefixWidget;

  /// The title displayed in the country picker dialog.
  /// Defaults to 'Select Country'.
  final String dialogTitle;

  /// The hint text displayed in the country picker search field.
  /// Defaults to 'Search by country name, code, or dial code'.
  final String searchHint;

  /// Text editing controller for the mobile number input.
  final TextEditingController? controller;

  /// Padding around the prefix icon (country selector).
  /// Defaults to EdgeInsets.only(left: 16, right: 5).
  final EdgeInsetsGeometry prefixPadding;

  /// Callback function triggered when a country is selected.
  final void Function(Country)? onCountrySelected;

  /// Whether the input field should display in error state.
  /// Defaults to false.
  final bool isError;

  /// Whether the input field is enabled for user interaction.
  /// Defaults to true.
  final bool isEnabled;

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  late Country selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = countries.firstWhere(
      (country) => country.code == 'ID',
      orElse: () => countries.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      autovalidateMode: widget.autovalidateMode,
      textInputType: widget.textInputType,
      controller: widget.controller,
      prefixPadding: widget.prefixPadding,
      enabled: widget.isEnabled,
      fillColor: widget.isError ? context.color.red10 : null,
      border: widget.isError
          ? Border.all(color: context.color.borderError, width: 2)
          : null,
      inputFormatters: widget.inputFormatters ??
          [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(selectedCountry.maxLength),
          ],
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a mobile number';
            }
            if (value.length < selectedCountry.minLength ||
                value.length > selectedCountry.maxLength) {
              return 'Mobile number must be between ${selectedCountry.minLength} and ${selectedCountry.maxLength} digits';
            }
            return null;
          },
      prefixIcon: InkWell(
        onTap: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => CountryPickerSheet(
            dialogTitle: widget.dialogTitle,
            searchHint: widget.searchHint,
            selectedCountry: selectedCountry,
            onCountrySelected: (Country country) {
              setState(() => selectedCountry = country);
              widget.onCountrySelected?.call(selectedCountry);
              Navigator.pop(context);
            },
          ),
        ),
        child: widget.prefixWidget ??
            Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${selectedCountry.flag} +${selectedCountry.dialCode}',
                  style: AppFonts.medium16.copyWith(
                    color: widget.isEnabled ? null : context.color.bgContrast,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
      ),
    );
  }
}

/// A modal bottom sheet widget for selecting countries in the mobile number input.
///
/// The CountryPickerSheet provides a searchable list of countries with their
/// flags, names, codes, and dial codes. It allows users to filter countries
/// by name, country code, or dial code for easy selection.
class CountryPickerSheet extends StatefulWidget {
  const CountryPickerSheet({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
    required this.dialogTitle,
    required this.searchHint,
  });

  /// The currently selected country in the mobile number input.
  final Country selectedCountry;

  /// Callback function triggered when a country is selected from the list.
  final void Function(Country) onCountrySelected;

  /// The title displayed at the top of the country picker sheet.
  final String dialogTitle;

  /// The hint text displayed in the search field.
  final String searchHint;

  @override
  State<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  List<Country> filteredCountries = countries;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            widget.dialogTitle,
            style: AppFonts.semiBold18,
          ),
          const SizedBox(height: 16),
          SearchField(
            autofocus: true,
            hintText: widget.searchHint,
            onChanged: (value) => setState(() {
              searchQuery = value;
              filteredCountries = countries.where((country) {
                return country.name
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    country.dialCode.contains(value) ||
                    country.code.toLowerCase().contains(value.toLowerCase());
              }).toList();
            }),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                final isSelected = country.code == widget.selectedCountry.code;

                return ListTile(
                  onTap: () => widget.onCountrySelected(country),
                  leading: Text(
                    country.flag,
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text(
                    country.name,
                    style: AppFonts.medium16,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+${country.dialCode}',
                        style: AppFonts.regular14.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
