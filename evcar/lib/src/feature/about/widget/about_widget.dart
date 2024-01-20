import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/about/widget/about_text.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutText.secText(
                "مرحبًا بك في Electro Car Care، المكان الذي يجسد رؤيتنا الرائدة في تقديم خدمات متكاملة لمالكي وعشاق السيارات الكهربائية. نحن نفخر بأن نكون وجهتك الشاملة لكل ما يتعلق بالمستقبل المستدام للنقل."),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            AboutText.mainText("رؤيتنا"),
            AboutText.secText(
                "فيElectro Car Care، نسعى جاهدين لتحقيق مستقبل أكثر استدامة من خلال تعزيز انتقال العالم إلى تكنولوجيا السيارات الكهربائية. نحن نؤمن بأن التكنولوجيا البيئية يمكنها تحسين حياة الناس والحفاظ على كوكب الأرض."),
            AboutText.mainText("خدماتنا"),
            AboutText.secText(
                "1. خدمات الشحن: نقدم لك خدمات شحن متنوعة، بدءًا من الشحن الثابت في مواقع محددة حتى الشحن المتنقل أثناء تنقلك، لضمان أن سيارتك الكهربائية دائمًا جاهزة للمغامرات."),
            AboutText.secText(
                "2. خدمات الصيانة: نهتم بسيارتك كما تهتم بها، ونقدم خدمات صيانة محترفة للحفاظ على أداء سيارتك بأعلى مستوياته."),
            AboutText.secText(
                "3. بيع وشراء السيارات: سواء كنت ترغب في بيع سيارتك الكهربائية الحالية أو شراء سيارة جديدة، نقدم لك منصة آمنة وموثوقة لتلبية احتياجاتك."),
            AboutText.mainText("ركيزة قوتنا"),
            AboutText.secText(
                "تتمثل قوتنا في الابتكار والالتزام بتقديم تجربة فريدة للمستخدمين. نحن ندمج التكنولوجيا الحديثة بأسلوبنا لتحقيق تواصل فعّال وتلبية توقعاتك."),
            AboutText.secText(
                "نحن ندعوك للانضمام إلى Electro Car Care وتجربة مستقبل النقل الأكثر استدامة وابتكارًا. دعونا نبني معًا مجتمعًا يشارك الرؤية نحو عالم أفضل وأكثر صفاءً."),
            AboutText.secText(
                "شكرًا لاختيارك Electro Car Care. معًا، نحقق التغيير ونبني مستقبلًا أكثر إشراقًا."),
          ],
        ),
      ),
    );
  }
}
