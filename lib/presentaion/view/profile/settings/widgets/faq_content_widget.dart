import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';

class FaqContentWidget extends StatelessWidget {
  FaqContentWidget({super.key});

  final List<dynamic> faqItems = [
    {
      "question": "What should I expect during a doctor's appointment?",
      'answer':
          "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary",
    },
    {
      "question": "What should I bring to my doctor's appointment?",
      'answer':
          " Any recent test results, X-rays, or records from other doctors if they weren't sent ahead",
    },
    {
      "question": "What if I need to cancel or reschedule my appointment?",
      'answer':
          "When you call to cancel, ask for the next available slot to ensure you don't fall behind on your care.",
    },
    {
      "question": "How do I make an appointment with a doctor?",
      'answer':
          "Check with your insurance to see who is 'in-network' to save money.",
    },
    {
      "question": "How early should I arrive for my doctor's appointment?",
      'answer':
          "15 to 20 Minutes Early: This gives you time to find parking, check in, and complete any necessary new-patient paperwork or insurance updates. ",
    },
    {
      "question": "How long will my doctor's appointment take?",
      'answer':
          "Typical Range: A standard check-up usually takes 15 to 30 minutes with the doctor, but your total time in the office (including the waiting room) may be 60 to 90 minutes.",
    },
    {
      "question": "How much will my doctor's appointment cost?",
      'answer':
          "Co-pays: If you have insurance, you usually pay a fixed 'co-pay' at the time of the visit (often between \$20 and \$50).",
    },
    {
      "question": "What should I look for in a good doctor?",
      'answer':
          "Communication: They should listen actively and explain things in plain language without overusing medical jargon.",
    },
    {
      "question":
          "What happens if I forget to ask a question during the visit?",
      'answer':
          "Answer: Most offices allow you to follow up via a patient portal (like MyChart) or by calling the nurse’s line. Don't hesitate to reach out if you realize you missed something important",
    },
    {
      "question": "Can I bring someone with me to the appointment?",
      'answer':
          "Answer: Yes, usually. Bringing a trusted friend or family member can help you remember details, take notes, and provide emotional support, especially if you are receiving complex information.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIconCubit, ToggleIconState>(
      builder: (BuildContext context, ToggleIconState state) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final showAnswer = state.showAnswer[index] ?? false;
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      faqItems[index]['question'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<ToggleIconCubit>().showAnswer(index);
                    },
                    child: Icon(
                      showAnswer == false
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),
              subtitle: showAnswer == false
                  ? SizedBox()
                  : Text(
                      faqItems[index]['answer'],
                      style: TextStyle(fontSize: 16.sp),
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.grey[200], thickness: 0.5.h);
          },
          itemCount: faqItems.length,
        );
      },
    );
  }
}
