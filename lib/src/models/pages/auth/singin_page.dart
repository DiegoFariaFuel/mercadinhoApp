import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mercadinho/src/Config/custom_color.dart';
import 'package:mercadinho/src/models/pages/auth/components/custom_textfild.dart';
import 'package:mercadinho/src/models/pages/auth/singup_screen.dart';
import 'package:mercadinho/src/models/pages/base/base_screen.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          //& Coluna principal
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //* Filho primario principal
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 40),
                          children: [
                            const TextSpan(
                              text: 'Store',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Me',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: DefaultTextStyle(
                          style: const TextStyle(fontSize: 25),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration.zero,
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Legumes'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Laticinios')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //*Container secundario principal
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45), bottom: Radius.circular(8)),
                ),
                //Campos de senha e email
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextfild(icon: Icons.email, label: 'E-email'),
                    const CustomTextfild(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    //Botao de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const BaseScreen();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'ENTRAR',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    //Botao esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                              color: CustomColors.customContrastColor),
                        ),
                      ),
                    ),
                    //Linha de divisao com ou
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                    //Botao personalizado criar conta
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            side: const BorderSide(
                                width: 2, color: Colors.green)),
                        //Botao de criar conta
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SingUpScreen();
                          }));
                        },
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
