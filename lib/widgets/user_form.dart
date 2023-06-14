import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserForm extends StatefulWidget {
  final BoolCallback onFormFilled;
  const UserForm({Key? key, required this.onFormFilled}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController inputDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final BoolCallback onFormFilled;


  @override
  void initState() {
    inputDate.text = '';
    super.initState();
    onFormFilled = (isFilled) {};
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:  DateTime(1900),
        lastDate:  DateTime.now().add(const Duration(days: 1),),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color.fromRGBO(73, 96, 249, 1),
                onPrimary: Color.fromRGBO(245, 245, 245, 1),
                onSurface: Color.fromRGBO(73, 96, 249, 1),
                surface: Color.fromRGBO(73, 184, 249, 1),
              )
            ),
            child: child!);
      },
    );

    if(picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {
        inputDate.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Username",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
           TextFormField(
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Your username",
            ),
             validator: (value) {
               if(value == null || value.isEmpty){
                 return 'Empty';
               }
               return null;
             },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
          const Text("First name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your name"
            ),
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'Empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
          const Text("Last name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your last name"
            ),
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'Empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
          const Text("Date of birth",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: inputDate,
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'Empty';
              }
              return null;
            },
            readOnly: true,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your birthday (dd-mm-yy)"
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await _selectDate();
            },
          ),
        ],
      ),
      onChanged: () {
        setState(() {
          widget.onFormFilled(_formKey.currentState!.validate());
        });
      },
    );
  }
}

typedef BoolCallback = void Function(bool isFilled);