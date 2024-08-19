import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_screen.dart';

class WriteNFC extends StatefulWidget {
  const WriteNFC({super.key});

  @override
  State<WriteNFC> createState() => _WriteNFCState();
}

class _WriteNFCState extends State<WriteNFC>
    with SingleTickerProviderStateMixin {
  //final controller = SlidableController();
  @override
  // void initState() {
  //   BlocProvider.of<ContactBloc>(context).add(GetEvnet());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WriteContactToNfcScreen()));
            },
            child: Text("Save to contact")),
      ],
    );
    // Padding(
    //   padding: EdgeInsets.symmetric(
    //       horizontal: SizeConfig.screenWidth! * 0.04,
    //       vertical: SizeConfig.screenWidth! * 0.04),
    //   child: Column(
    //     children: [
    //       CustomButton(
    //         bgColor: MyColors.secondaryColor,
    //         textColor: MyColors.textColor,
    //         title: "Add a record",
    //         onPressed: () {
    //           Navigator.of(context).push(MaterialPageRoute(
    //               builder: (context) => const AddRecordScreen()));
    //         },
    //       ),
    //       CustomButton(
    //         onPressed: () {},
    //         bgColor: MyColors.secondaryColor,
    //         textColor: MyColors.textColor,
    //         title: "More options",
    //       ),
    //       CustomButton(
    //         onPressed: () {},
    //         bgColor: MyColors.secondaryColor,
    //         textColor: MyColors.textColor,
    //         title: "Write/ 102 Bytes",
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const Divider(
    //         height: 1,
    //         color: MyColors.errorColor,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Expanded(child: BlocBuilder<ContactBloc, ContactState>(
    //         builder: (context, state) {
    //           if (state is SuccessContactState) {
    //             return state.contactModel!.isNotEmpty
    //                 ? ListView.builder(
    //                     itemCount: state.contactModel!.length,
    //                     itemBuilder: (context, index) {
    //                       log(state.contactModel.toString());
    //                       return Slidable(
    //                         key: const ValueKey(0),
    //                         startActionPane: ActionPane(
    //                           motion: const BehindMotion(),
    //                           children: [
    //                             // A SlidableAction can have an icon and/or a label.
    //                             SlidableAction(
    //                               onPressed: (context) {
    //                                 context
    //                                     .read<ContactBloc>()
    //                                     .add(DeleteContactEvent(index));
    //                               },
    //                               backgroundColor: const Color(0xFFFE4A49),
    //                               foregroundColor: Colors.white,
    //                               icon: Icons.delete,
    //                               label: 'Delete',
    //                             ),
    //                             SlidableAction(
    //                               onPressed: (context) {},
    //                               backgroundColor: const Color(0xFF21B7CA),
    //                               foregroundColor: Colors.white,
    //                               icon: Icons.update,
    //                               label: 'Update',
    //                             ),
    //                           ],
    //                         ),
    //                         child: Card(
    //                           color: MyColors.secondaryColor,
    //                           child: Container(
    //                             width: SizeConfig.screenWidth,
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Column(
    //                               mainAxisSize: MainAxisSize.min,
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text(
    //                                   "${state.contactModel![index].pref.toString()} ${state.contactModel![index].contactName.toString()}",
    //                                 ),
    //                                 Text(state.contactModel![index].companyName
    //                                     .toString()),
    //                                 Text(state.contactModel![index].address
    //                                     .toString()),
    //                                 Text(state.contactModel![index].phoneNumber
    //                                     .toString()),
    //                                 Text(state.contactModel![index].phoneNumber2
    //                                     .toString()),
    //                                 Text(
    //                                   "${state.contactModel![index].email.toString()} :",
    //                                   style: Theme.of(context)
    //                                       .textTheme
    //                                       .bodyMedium!
    //                                       .copyWith(
    //                                           fontWeight: FontWeight.bold),
    //                                 ),
    //                                 Text(state.contactModel![index].website
    //                                     .toString()),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     },
    //                   )
    //                 : const Center(
    //                     child: Text("Data not found"),
    //                   );
    //           } else if (state is LoadingContactState) {
    //             return const Center(
    //                 child: CircularProgressIndicator.adaptive());
    //           } else if (state is ErrorContactState) {
    //             return const Center(
    //               child: Text("Data Error"),
    //             );
    //           }
    //           return const Text("");
    //         },
    //       )),
    //     ],
    //   ),
    // );
  }
}
