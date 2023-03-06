import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx/features/core/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
        child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offlineFailure
        ? Center(
        child: Text("Offline Failure"))
        : statusRequest == StatusRequest.serverFailure
        ? Center(
        child: Text("Server Failure"))
        : statusRequest == StatusRequest.failure
        ? Center(
        child: Text("Failure"))
        : widget;
  }
}
