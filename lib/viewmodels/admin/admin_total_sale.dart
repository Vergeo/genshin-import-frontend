import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/services/sale_service.dart';

class AdminTotalSale extends StatefulWidget {
  const AdminTotalSale({super.key});

  @override
  State<AdminTotalSale> createState() => _AdminTotalSaleState();
}

class _AdminTotalSaleState extends State<AdminTotalSale> {
  double totalSale = 0;

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    loadTotalSale();
  }

  void loadTotalSale() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final double data = await SaleService.getTotalSale();

      setState(() {
        totalSale = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadTotalSale,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : errorMessage != null
        ? Center(child: Text(errorMessage!))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currencyNotifier.value.format(totalSale),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: GIStyle.subText[darkMode.value],
                ),
              ),
            ],
          );
  }
}
