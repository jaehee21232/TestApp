import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  //<FormState>를 쓰면 Form에서 쓸수있는 키가됨
  late FocusNode nameFocusNode;
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "공백은 에바지;;";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("오류 없음")));
                        }
                      }),
                      child: const Text("완료")),
                ),
                TextField(
                  controller: nameController,
                  onChanged: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  focusNode: nameFocusNode,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: "TextField hintText",
                      border: InputBorder.none,
                      labelText: "TextField"),
                ),
                ElevatedButton(
                  onPressed: (() {
                    FocusScope.of(context).requestFocus(nameFocusNode);
                  }),
                  child: const Text("포커스"),
                ),
                ElevatedButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(nameController.text),
                        );
                      },
                    );
                  }),
                  child: const Text("TextField 값 확인"),
                )
              ],
            )),
      ),
    );
  }
}
