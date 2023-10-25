import 'package:exam_reminder/global_methods.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:window_manager/window_manager.dart';

class TitleBarWindowDraggable extends StatelessWidget {
  const TitleBarWindowDraggable({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (!isPlatformDesktop()) {
      return child ?? const SizedBox();
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) {
        windowManager.startDragging();
      },
      onDoubleTap: () async {
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        } else {
          windowManager.maximize();
        }
      },
      child: child,
    );
  }
}

class TitleBarButtons extends StatefulWidget {
  const TitleBarButtons({super.key});

  @override
  State<TitleBarButtons> createState() => _TitleBarButtonsState();
}

class _TitleBarButtonsState extends State<TitleBarButtons> {
  bool isMaximized = false;
  String minimizedMaximizedSvg = "assets/maximize.svg";

  @override
  Widget build(BuildContext context) {
    if (!isPlatformDesktop()) {
      return const SizedBox();
    }
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await windowManager.minimize();
          },
          icon: SvgPicture.asset("assets/minimize.svg"),
          tooltip: AppLocalizations.of(context)!.titleBarMinimizeTollTip,
        ),
        IconButton(
          onPressed: () async {
            if (await windowManager.isMaximized()) {
              await windowManager.unmaximize();
              isMaximized = false;
              minimizedMaximizedSvg = "assets/maximize.svg";
            } else {
              await windowManager.maximize();
              isMaximized = true;
              minimizedMaximizedSvg = "assets/un-maximize.svg";
            }
            setState(() {});
          },
          icon: SvgPicture.asset(minimizedMaximizedSvg),
          tooltip: isMaximized
              ? AppLocalizations.of(context)!.titleBarUNMaximizeToolTip
              : AppLocalizations.of(context)!.titleBarMaximizeToolTip,
        ),
        IconButton(
          onPressed: () async {
            await windowManager.close();
          },
          icon: SvgPicture.asset("assets/close.svg"),
          tooltip: AppLocalizations.of(context)!.titleBarCloseToolTip,
        ),
      ],
    );
  }
}
