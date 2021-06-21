import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/models/api_response_models/transaction/transaction.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class RecentTransactions extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(recentTransactionsProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(recentTransactionsProvider.notifier).fetchTransactions();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      appBar: titleAppbar(context, 'RECENT_TRANSACTIONS'.tr),
      body: Stack(
        children: [
          ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.transactions.length,
              itemBuilder: (BuildContext context, int index) {
                handleScrollWithIndex(
                    index,
                    state.pageNumber,
                    () => context
                        .read(recentTransactionsProvider.notifier)
                        .fetchTransactions());
                return transactCard(context, state.transactions[index], state);
              }),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerBody())
        ],
      ),
    );
  }

  Widget transactCard(context, Transaction transaction, state) {
    String status;
    switch (transaction.transactionType) {
      case WalletTransactionType.orderCancelled:
        status =
            '${'ON_CANCELLING_ORDER_ID'.tr}: ${transaction.orderID.toString()}';
        break;
      case WalletTransactionType.orderPayment:
        status =
            '${'ON_PLACING_ORDER_ID'.tr}: ${transaction.orderID.toString()}';
        break;
      case WalletTransactionType.walletTopup:
        status = 'ON_RECHARGING_WALLET'.tr;
        break;
      case WalletTransactionType.walletTopUpByLoyalty:
        status = 'ON_REDEEMING_COOKIE_POINT'.tr;
        break;
      default:
        status = '';
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (transaction.isCredited!)
                Text(
                  'AMOUNT_CREDITED'.tr,
                  style: textDarkLight2SmallBM(context),
                )
              else
                Text(
                  'AMOUNT_DEBITED'.tr,
                  style: textDarkLight2SmallBM(context),
                ),
              titleTextDarkLightXSmallBR(
                context,
                DateFormat('dd MMM').format(transaction.createdAt!),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          titleTextDarkLightXSmallBR(context, status),
          dottedLine(context, darkLight3.withOpacity(0.2), 12),
          Row(
            children: [
              if (transaction.isCredited!)
                Image.asset(
                  'lib/assets/icons/credit.png',
                  scale: 3,
                )
              else
                Image.asset(
                  'lib/assets/icons/debit.png',
                  scale: 3,
                ),
              SizedBox(
                width: 6,
              ),
              titleTextDarkLight3SmallBR(
                  context, '${state.currencySymbol}${transaction.amount}'),
              SizedBox(
                width: 6,
              ),
              if (transaction.isCredited!)
                titleTextDarkLightXSmallBR(context, 'CREDITED_TO_WALLET'.tr)
              else
                titleTextDarkLightXSmallBR(context, 'DEBITED_FROM_WALLET'.tr)
            ],
          ),
        ],
      ),
    );
  }

  Widget shimmerBody() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: 4,
        itemBuilder: (context, i) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        height: 15,
                        width: 80,
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        height: 10,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                    height: 10,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        height: 10,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 1, color: Colors.grey[300]);
        },
      ),
    );
  }
}
