import 'package:flutter/material.dart';

class AppListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool? value;
  final Function? onTap;
  final Widget? onChanged;
  const AppListTile({
    super.key,
    required this.title,
    this.onTap,
    this.value,
    this.onChanged,
    this.subtitle,
  });

  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap as void Function()?,
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: widget.subtitle != null && widget.subtitle!.isNotEmpty
          ? Text(
              widget.subtitle!,
              style: TextStyle(fontSize: 14),
            )
          : null,

      trailing: widget.onChanged,
      // onTap: () => onChanged,
    );
  }
}
