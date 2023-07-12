import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mercadinho/src/Config/custom_color.dart';
import 'package:mercadinho/src/models/pages/auth/components/custom_textfild.dart';

class SingUpScreen extends StatelessWidget {

  final cpfFormatter=MaskTextInputFormatter(mask: '###.###.###-##',filter: {'#': RegExp(r'[0-9]')});
  final numeroFormatter=MaskTextInputFormatter(mask: '(##) # ####-####',filter: {'#': RegExp(r'[0-9]')});

  SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  //Filho primario logo
                  const Expanded(
                      child: Center(
                    child:  Text(
                      'Cadrastro',
                      
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  //formulario secundario
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    //Campos de texto
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextfild(icon: Icons.email, label: 'E-mail'),
                        const CustomTextfild(
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                        ),
                        const CustomTextfild(icon: Icons.person, label: 'Nome'),
                        CustomTextfild(icon: Icons.phone, label: 'Telefone',inputFormatters: [numeroFormatter],),
                        CustomTextfild(icon: Icons.file_copy, label: 'CPF',inputFormatters: [cpfFormatter],),
                        //Botao de cadrastro
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18))),
                                child: const Text(
                                  'Cadrastrar-se',
                                  style: TextStyle(fontSize: 18),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            Positioned(
              left: 10,top: 10,
              child: SafeArea(child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,))))
            ],
          ),
        ),
      ),
    );
  }
}
