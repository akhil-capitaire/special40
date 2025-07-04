import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/size.dart';
import 'package:special40/utils/spaces.dart';
import 'package:special40/widgets/form_input.dart';

import '../../widgets/custom_scaffold.dart';

class CourseEnrollmentPage extends ConsumerStatefulWidget {
  const CourseEnrollmentPage({super.key});

  @override
  ConsumerState<CourseEnrollmentPage> createState() =>
      CourseEnrollmentPageState();
}

class CourseEnrollmentPageState extends ConsumerState<CourseEnrollmentPage> {
  int currentStep = 0;
  bool showAddCardForm = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: '',
      isScrollable: false,
      onBackPressed: () {
        if (currentStep > 0) {
          setState(() {
            currentStep--;
            showAddCardForm = false;
          });
        } else {
          Navigator.of(context).pop(); // Pass back result if needed.
        }
      },
      body: Column(
        children: [
          buildStepper(),
          if (currentStep == 0) buildOverView(),
          if (currentStep == 1) buildPaymentMethod(),
          if (currentStep == 2) buildConfirmation(),
          const Spacer(),
          CustomButton(
            label: 'Continue',
            onPressed: () {
              setState(() {
                if (currentStep < 2) {
                  currentStep++;
                }
              });
            },
            isSmall: false,
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  Widget buildStepper() {
    final steps = ['Overview', 'Payment Method', 'Confirmation'];
    const avatarRadius = 18.0;
    const avatarDiameter = avatarRadius * 2;
    const animationDuration = Duration(milliseconds: 300);

    return Column(
      children: [
        // Avatars + connectors
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              final stepIndex = (i - 1) ~/ 2;
              final isCompleted = stepIndex < currentStep;

              return Expanded(
                child: AnimatedContainer(
                  duration: animationDuration,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 2,
                  color: isCompleted ? Colors.teal : Colors.black26,
                ),
              );
            } else {
              final index = i ~/ 2;
              final isActive = index == currentStep;
              final isCompleted = index < currentStep;

              return SizedBox(
                width: avatarDiameter,
                height: avatarDiameter,
                child: AnimatedContainer(
                  duration: animationDuration,
                  decoration: BoxDecoration(
                    color: isActive || isCompleted
                        ? Colors.teal
                        : Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          }),
        ),
        const SizedBox(height: 8),
        // Step labels (animated style)
        // Row(
        //   children: List.generate(steps.length, (index) {
        //     final isActive = index == currentStep;
        //
        //     return Expanded(
        //       child: Align(
        //         alignment: Alignment.center,
        //         child: AnimatedDefaultTextStyle(
        //           duration: animationDuration,
        //           style: TextStyle(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w500,
        //             color: isActive ? Colors.teal : Colors.black87,
        //           ),
        //           child: Text(steps[index], textAlign: TextAlign.center),
        //         ),
        //       ),
        //     );
        //   }),
        // ),
      ],
    );
  }

  Widget buildCourseHighlightCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        children: const [
          CourseFeatureItem(icon: Icons.menu_book, text: '80+ Lectures'),
          CourseFeatureItem(icon: Icons.verified, text: 'Certificate'),
          CourseFeatureItem(icon: Icons.schedule, text: '8 Weeks'),
          CourseFeatureItem(icon: Icons.local_offer, text: '10% Off'),
        ],
      ),
    );
  }

  Widget buildCourseDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              text: 'Course Rating : ',
              children: [
                WidgetSpan(
                  child: Icon(Icons.star, color: Colors.blue, size: 16),
                ),
                WidgetSpan(
                  child: Icon(Icons.star, color: Colors.blue, size: 16),
                ),
                WidgetSpan(
                  child: Icon(Icons.star, color: Colors.blue, size: 16),
                ),
                WidgetSpan(
                  child: Icon(Icons.star, color: Colors.blue, size: 16),
                ),
                WidgetSpan(
                  child: Icon(Icons.star, color: Colors.blue, size: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              text: 'Course Time : ',
              children: [
                TextSpan(
                  text: '8 Weeks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              text: 'Course Trainer : ',
              children: [
                TextSpan(
                  text: 'Syed Hasnain',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPurchaseDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Purchase Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Date : 19/03/2024'), Text('Price : 72\$')],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Coupon : 10% Off'), Text('Final Price : 65\$')],
          ),
        ],
      ),
    );
  }

  Widget buildOverView() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              text: 'Course Name : ',
              children: [
                TextSpan(
                  text: 'Graphic Design',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        buildCourseHighlightCard(),
        const SizedBox(height: 16),
        buildCourseDetails(),
        const SizedBox(height: 16),
        buildPurchaseDetailsCard(),
      ],
    );
  }

  Widget buildPaymentMethod() {
    final paymentMethods = [
      {'icon': Icons.credit_card, 'label': 'Credit Card'},
      {'icon': Icons.account_balance_wallet, 'label': 'Wallet'},
      {'icon': Icons.paypal, 'label': 'PayPal'},
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: showAddCardForm
          ? buildAddCardForm()
          : buildPaymentOptions(paymentMethods),
    );
  }

  Widget buildPaymentOptions(List<Map<String, dynamic>> paymentMethods) {
    return Column(
      key: const ValueKey('paymentOptions'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sb(0, 2),
        Text(
          'Select Payment Method',
          style: TextStyle(
            fontSize: baseFontSize + 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        sb(0, 2),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentMethods.length + 1,
          separatorBuilder: (_, __) => sb(0, 2),
          itemBuilder: (context, index) {
            if (index < paymentMethods.length) {
              final method = paymentMethods[index];
              return Card(
                color: AppColors.blueLight,
                child: ListTile(
                  leading: Icon(method['icon'] as IconData, color: Colors.teal),
                  title: Text(method['label'] as String),
                  trailing: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    // Handle payment selection
                  },
                ),
              );
            } else {
              return Card(
                color: AppColors.blueLight,
                child: ListTile(
                  leading: const Icon(Icons.add, color: Colors.teal),
                  title: const Text('Add New Card'),
                  onTap: () {
                    setState(() {
                      showAddCardForm = true;
                    });
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildAddCardForm() {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();
    return Column(
      key: const ValueKey('addCardForm'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sb(0, 1),
        const Text(
          'Add Card Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        sb(0, 1),

        FormInput(controller: nameController, hintText: 'Cardholder Name'),
        sb(0, 1),
        FormInput(
          controller: numberController,
          hintText: 'Card Number',
          keyboardType: TextInputType.number,
          maxlength: 16,
        ),
        sb(0, 1),
        Row(
          children: [
            Expanded(
              child: FormInput(
                controller: expiryController,
                hintText: 'Expiry (MM/YY)',
                keyboardType: TextInputType.number,
                maxlength: 5,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FormInput(
                controller: cvvController,
                hintText: 'CVV',
                keyboardType: TextInputType.number,
                maxlength: 3,
              ),
            ),
          ],
        ),
        sb(0, 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              label: 'Cancel',
              onPressed: () {
                setState(() {
                  showAddCardForm = false;
                });
              },
              isSmall: true,
              type: ButtonType.outlined,
            ),
            sb(5, 0),
            CustomButton(
              label: 'Save Card',
              onPressed: () {},
              isSmall: true,
              type: ButtonType.primary,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildConfirmation() {
    return Column(
      key: const ValueKey('confirmation'),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Transaction Completed!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Image.asset(
          "assets/images/illustrations/confirm.png",
          height: ScreenSize.height(50),
          width: ScreenSize.screenWidth,
        ),
      ],
    );
  }
}

class CourseFeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CourseFeatureItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.blue.shade900),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
