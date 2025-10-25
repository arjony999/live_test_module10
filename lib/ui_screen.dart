import 'package:flutter/material.dart';

class ContactListUI extends StatefulWidget {
  @override
  State<ContactListUI> createState() => _ContactListUIState();
}

class _ContactListUIState extends State<ContactListUI> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<Map<String, String>> contacts = [
    {"name": "Atik", "phone": "01732-208264"},
    {"name": "Sakib", "phone": "01599-485796"},
    {"name": "Golam", "phone": "01742-600222"},

  ];

  void _addContact() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        contacts.add({
          "name": _nameController.text,
          "phone": _phoneController.text,
        });
      });
      _nameController.clear();
      _phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        )
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Enter name" : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          )
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Enter phone number" : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Add",style: TextStyle(color: Colors.yellow),),
                ),
              ),
              const SizedBox(height: 20),

              // Contact List View
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.brown),
                      title: Text(
                        contacts[index]["name"]!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        contacts[index]["phone"]!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(Icons.call, color: Colors.blue),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}