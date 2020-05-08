import 'package:flutter/material.dart';
import '../routes/drawerconfig.dart';
class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Terms & Conditions"),
        centerTitle: true,
      ),
    body:SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Data Protection Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
            '''Your privacy is important to Healthway Medical Group. Healthway Medical Group is committed to protecting any personal information that you may provide to us. Further, Healthway Medical Group recognises the importance of informing you how Healthway Medical Group treat information about you that Healthway Medical Group may receive from the Site.

              In general, you can visit this Site without telling us who you are or revealing any information about yourself. Like most sites, Healthway Medical Group may use cookies to remember information about your preferences. You can set up your web browser to accept or reject cookies. Our web servers may collect the domain names, not the e-mail addresses, of visitors. In addition, there are portions of this Site where Healthway Medical Group may need to collect personal information from you for a specific purpose, such as to provide you with certain information you request. The information collected from you may include your name, address, telephone, fax number, or email address. You may refuse any request for personal information. This Site is not intended for persons under 13 years of age. Healthway Medical Group does not knowingly solicit or collect personal information from or about children, and Healthway Medical Group do not knowingly market our products or services to children.

      Domain name information that Healthway Medical Group collects is not used to personally identify you. It is used to measure viewer statistics, such as the numbers of viewers that visit the Site, average time spent on the Site, pages viewed, etc. Healthway Medical Group uses this information to measure the use of our Site and to improve the content of our Site.

      When other information is collected from you, such as your name and e-mail address, Healthway Medical Group will make reasonable efforts to let you know at the time of collection how this information will be used. Usually, the personal information you provide will only be used to respond to an inquiry you make or to process your request, This information may be shared with other Healthway Medical Group businesses, but only if necessary to fulfil your request or for related purposes.

      Healthway Medical Group does not share, sell, or lease personal information about you to any third parties for their marketing use. Healthway Medical Group will release information about you if you direct it to do so, if Healthway Medical Group is required by law to do so, or in other legally limited circumstances.

      If you register with one of Healthway Medical Groups business units online, they may use your information to provide you with custom information about Healthway Medical Group offerings in support of your business needs. You should review the private policy associated with that Healthway Medical Group business Sites for further information about that Healthway Medical Group business privacy practices.

      Healthway Medical Group Site may contain links to other sites such as Healthway Medical Group distributors and sales affiliates. While Healthway Medical Group makes reasonable efforts to try to link only to sites that share Healthway Medical Group high standards and respect for privacy, Healthway Medical Group is not responsible for the content, security, or privacy practices employed by other sites.

      Healthway Medical Group maintains strict physical, electronic and administrative safeguards to protect your personal information from unauthorised or inappropriate access. Healthway Medical Group restricts access to information about you to those Healthway Medical Group workers who need to know the information to respond to your inquiry or request. Workers who misuse personal information are subject to disciplinary action.

      Please check this privacy policy periodically to inform yourself of any changes. Healthway Medical Group reserves the right to modify or supplement this privacy policy from time to time. Healthway Medical Group will place such amendments on this Site.

      If you have any comments and questions about this privacy policy, please use the Contact Us page. Healthway Medical Group welcomes your questions and suggestions about this privacy policy.

      For PDPA (Personal Data Protect Act) related
       inquiries please email to dpo@healthwaymedical.com''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              maxLines: 300,
            ),
          )
        ],
      ),
    ),

    );
  }
}