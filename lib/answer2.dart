import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? _selectedGender;
  String? _selectedProvince;
  bool _acceptTerms = false;

  final List<String> _provinces = [
    'ในเมือง',
    'ต่างจังหวัด',
    'ต่างประเทศ',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select your gender")),
        );
        return;
      }
      if (_selectedProvince == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select your province")),
        );
        return;
      }
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You must accept the terms and conditions")),
        );
        return;
      }

      // ถ้าผ่านทุกเงื่อนไข แสดงผลข้อมูลที่กรอก
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Registration Successful"),
          content: Text("Name: ${nameController.text}\n"
              "Email: ${emailController.text}\n"
              "Gender: $_selectedGender\n"
              "Province: $_selectedProvince\n"
              "Accepted Terms: Yes"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คำนวณค่าจัดส่ง")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("น้ำหนักสินค้า (กก.):"),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณาใส่น้ำหนัก";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // เลือกระยะทาง
              Text("เลือกระยะทาง:"),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(),
                value: _selectedProvince,
                items: _provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProvince = value;
                  });
                },
                validator: (value) =>
                    value == null ? "กรุณาเลือกระยะทาง" : null,
              ),
              SizedBox(height: 10),

              // ยอมรับเงื่อนไข (Checkbox)
              Text("บริการเสริม:"),
              CheckboxListTile(
                title: const Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              SizedBox(height: 5),

              CheckboxListTile(
                title: const Text('ประกันพัสดุ (+50 บาท)'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              Text("เลือกความเร่งด่วน:"),
              CheckboxListTile(
                title: const Text('ปกติ'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              SizedBox(height: 5),

              CheckboxListTile(
                title: const Text('ด่วน'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              SizedBox(height: 5),

              CheckboxListTile(
                title: const Text('ด่วนพิเศษ'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              // ปุ่ม Submit
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("คำนวณราคา"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
