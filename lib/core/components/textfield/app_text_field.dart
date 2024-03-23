import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/custom_color.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.placeholder,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.textInputAction,
    this.isError = false,
    this.focusNode,
    this.showCursor = true,
    this.floatingLabelBehavior,
    this.keyboardType,
    this.hintStyle,
    this.hintText,
    this.textEditingController,
    this.enabled = false,
    this.inputFormatter,
    this.defaultBorderColor = CustomColor.gray,
    this.autoFocus = false,
    this.maxLength,
    this.textAlignVertical,
    this.expanded = false,
    this.defaultSize = 45,
    this.suffixIcon,
  }) : super(
          key: key,
        );

  final String? initialValue;
  final String? placeholder;
  final String? hintText;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final bool isError;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool showCursor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatter;
  final Color defaultBorderColor;
  final bool autoFocus;
  final int? maxLength;
  final TextAlignVertical? textAlignVertical;
  final bool expanded;
  final double defaultSize;
  final Widget? suffixIcon;

  @override
  InputWidgetState createState() => InputWidgetState();
}

class InputWidgetState extends State<AppTextField> {
  late final TextEditingController _controller;

  InputDecoration get _errorInputDecoration => InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        contentPadding: const EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        constraints: BoxConstraints(
          maxHeight: widget.defaultSize,
          minHeight: widget.defaultSize,
        ),
        alignLabelWithHint: true,
        labelText: widget.placeholder,
        floatingLabelStyle: TextStyle(
          color: widget.isError ? CustomColor.error : const Color(0xffACB5BD),
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: CustomColor.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: CustomColor.graySemiLight.withOpacity(.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: CustomColor.error,
          ),
        ),
        labelStyle: const TextStyle(
          color: CustomColor.error,
          fontSize: 18,
        ),
        suffixIcon: widget.suffixIcon,
      );

  InputDecoration get _defaultInputDecoration => InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.enabled
            ? CustomColor.defaultWhite
            : CustomColor.graySemiLight.withOpacity(.6),
        filled: true,
        contentPadding: const EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        constraints: BoxConstraints(
          maxHeight: widget.defaultSize,
          minHeight: widget.defaultSize,
        ),
        alignLabelWithHint: true,
        labelText: widget.placeholder,
        floatingLabelStyle: const TextStyle(
          color: CustomColor.defaultBlack,
          fontSize: 18,
        ),
        labelStyle: const TextStyle(
          color: CustomColor.defaultBlack,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: widget.defaultBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: CustomColor.blueTrue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: widget.defaultBorderColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: CustomColor.defaultWhite,
          ),
        ),
        floatingLabelBehavior: widget.floatingLabelBehavior,
        suffixIcon: widget.suffixIcon,
      );

  @override
  void initState() {
    _controller = widget.textEditingController ?? TextEditingController();
    _controller.text = widget.textEditingController?.text ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xffACB5BD),
      ),
      child: TextFormField(
        cursorColor: widget.isError ? CustomColor.error : CustomColor.blueTrue,
        inputFormatters: widget.inputFormatter,
        cursorWidth: 1,
        style: TextStyle(
          color: widget.enabled ? CustomColor.defaultBlack : CustomColor.gray,
        ),
        focusNode: widget.focusNode,
        textAlignVertical: widget.textAlignVertical,
        expands: widget.expanded,
        maxLines: widget.expanded ? null : 1,
        controller: _controller,
        textInputAction: widget.textInputAction,
        showCursor: widget.showCursor,
        enabled: widget.enabled,
        decoration:
            widget.isError ? _errorInputDecoration : _defaultInputDecoration,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onSubmitted,
        keyboardType: widget.keyboardType,
        autofocus: widget.autoFocus,
        maxLength: widget.maxLength,
      ),
    );
  }
}
