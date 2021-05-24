import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:flutter/widgets.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isEnabledSpacer;

  const RowWidget(this.title, this.value, {this.isEnabledSpacer = false})
      : super();

  @override
  Widget build(BuildContext context) {
    return buildRow();
  }

  Widget buildRow() {
    return (title == null || value == null)
        ? SizedBox()
        : Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Text(
                  title,
                  style: h14Grey,
                ),
                isEnabledSpacer ? Spacer() : SizedBox(),
                Text(
                  value,
                  style: h14Black,
                )
              ],
            ),
          );
  }
}
