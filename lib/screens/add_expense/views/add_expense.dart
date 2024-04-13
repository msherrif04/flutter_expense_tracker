import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Expenses',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.grey,
                      size: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              TextFormField(
                onTap: () {},
                readOnly: true,
                controller: categoryController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.list,
                    color: Colors.grey,
                    size: 16,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                                title: const Text('Create a new category'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Name',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Icon',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Color',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          "${newDate.day}/${newDate.month}/${newDate.year}";
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.grey,
                    size: 16,
                  ),
                  hintText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text('Save',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
