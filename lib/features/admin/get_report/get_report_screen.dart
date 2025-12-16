import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:banking_system/core/helpers/sharedpreference.dart';
import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/networking/api_constants.dart';

class GetReportScreen extends StatefulWidget {
  const GetReportScreen({super.key});

  @override
  State<GetReportScreen> createState() => _GetReportScreenState();
}

class _GetReportScreenState extends State<GetReportScreen> {
  DateTime? startDate;
  DateTime? endDate;
  bool isLoading = false;

  Dio? dio;

  @override
  void initState() {
    super.initState();
    _initDio();
  }

  Future<void> _initDio() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        headers: {
          'Accept': 'application/pdf',
          'Authorization': 'Bearer $token',
        },
        responseType: ResponseType.bytes,
      ),
    );
  }

  Future<void> pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        isStart ? startDate = picked : endDate = picked;
      });
    }
  }

  Future<void> downloadReport() async {
    if (dio == null) return;

    if (startDate == null || endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select start and end dates')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await dio!.post(
      '${ApiConstants.apiBaseUrl}GetReport',
        data: FormData.fromMap({
          'start_date': startDate!.toIso8601String().split('T').first,
          'end_date': endDate!.toIso8601String().split('T').first,
        }),
      );

      // 🔍 DEBUG
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response type: ${response.data.runtimeType}');

      final blob = html.Blob([response.data], 'application/pdf');

      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute(
          'download',
          'report_${DateTime.now().millisecondsSinceEpoch}.pdf',
        )
        ..click();

      html.Url.revokeObjectUrl(url);
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.response?.data}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download report')),
      );
    } catch (e) {
      debugPrint('Unknown error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unexpected error occurred')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Reports')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                startDate == null
                    ? 'Start Date'
                    : startDate!.toIso8601String().split('T').first,
              ),
              trailing: const Icon(Icons.date_range),
              onTap: () => pickDate(isStart: true),
            ),
            ListTile(
              title: Text(
                endDate == null
                    ? 'End Date'
                    : endDate!.toIso8601String().split('T').first,
              ),
              trailing: const Icon(Icons.date_range),
              onTap: () => pickDate(isStart: false),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.picture_as_pdf),
                label: Text(
                  isLoading ? 'Downloading...' : 'Download PDF Report',
                ),
                onPressed: isLoading ? null : downloadReport,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
