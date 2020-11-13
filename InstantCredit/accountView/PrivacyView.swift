//
//  PrivacyView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct PrivacyView: View {
        @State var selection: Int?
        
        var body: some View {

                VStack {
                    
                    Text("")
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    
                    
                    Image("cropped-img7")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                        .overlay(
                            Text("Help us match you to the right counselor.")
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .opacity(0.7)
                        )
                          
                    
                    
                    HStack {
                        ForEach(0..<10) { index in
                            Rectangle()
                                .foregroundColor(Color(index == 8 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    
                    
                    
                    
                    Text("You authorize Costco to use and disclose personal health information as stated below: ")
                    
                    Text("""
                
                1. COSTCO'S COMMITMENT TO PRIVACY.
                Costco is committed to protecting the privacy of our customers. We have and will take measures that protect the privacy of personal information and personal health information held by us.
                This Privacy Policy provides you with details regarding: (1) why we collect personal information and personal health information; (2) what we do with that information; (3) the steps we take to ensure that access to that information is secure; (4) how you can access personal information and personal health information pertaining to you; and (5) who you should contact if you have questions or concerns about our policies or practices.
                Since we regularly review our policies and practices, your comments are always welcome. We reserve the right to change this Privacy Policy at any time; however, any changes or additions to Section 5 regarding the reasons we use personal information will not apply to you unless you consent to them. We will alert you that changes have been made by indicating at the top of the Privacy Policy the date that it was last updated. This Privacy Policy was last updated on April 22, 2013. We encourage you to review our Privacy Policy to make sure that you understand how information that you provide will be used.
                Children: We encourage parents to take an active interest in their children's use of the Internet. We do not intend to collect information from children who are under 18 years of age. If you are under 18, please do not provide information on our Web site.

                2. WHAT IS PERSONAL INFORMATION?
                In general terms, personal information means any information about an identifiable individual. For example, this includes your name, postal and e-mail address, telephone number, credit card number, demographic information and purchasing history. A special category of personal information is "personal health information", which we describe in Section 3 below.
                Personal information does not include aggregate information (data about a group or category of products, services or customers, from which individual customer identities have been removed). For example, information about how you use a service may be collected and combined with information about how others use the same service, but no personal information will be included in the resulting data. Likewise, information about the products you purchase may be collected and combined with information about the products purchased by others. Aggregate information about product purchases helps us understand trends and customer needs. It can also assist us in determining whether it would be appropriate to offer new Web site functions by looking at customer Web site browsing activities.

                3. WHAT IS PERSONAL HEALTH INFORMATION?
                Personal health information means any information relating to your physical or mental health collected or generated in the course of our providing you with the health services you request, and prescription profiles for fulfillment of pharmacy orders. Examples of personal health information may include your medical history, drug prescription information, or health insurance information, which we may require in order to provide you with pharmacy-related services. It may also include information you provide to Costco health services personnel when receiving counselling or advice, or when contacting Costco with a comment, question or complaint about our health services.

                4. WHEN WE COLLECT PERSONAL INFORMATION.
                We only collect such personal information as is strictly necessary for the purposes outlined in Section 5. We collect personal information: (1) when you contact us; (2) when you use our Web site; (3) when you participate in any of our programs; and (4) when you place orders or make purchases on our Web site. We may automatically collect some information when you visit our Web site, such as your computer's network address and operating system, the site from which you linked to us, and the time and date of your visit and purchases. This information is not linked by us to personal information, but rather is only used to compile aggregate information. This information may be collected through the use of cookies (see our "On-line privacy practices" in Section 12 below).

                5. HOW WE USE PERSONAL INFORMATION.
                As part of our business operations, we hold and use certain personal information pertaining to you in order to process your requests, and to understand your needs so that we can serve you better. If you ask us to, we will also tell you about opportunities we think will be of interest to you, such as our promotional programs. Specifically, we may use personal information for the following purposes:
                Notifying you of recalls or safety issues;
                Managing the provision of goods and services to you, including to determine your credit status and for fraud detection and identification purposes;
                Managing invoicing, accounting and information security services related to our transactions with you;
                Monitoring your satisfaction with our programs and services and contacting you regarding the status of such programs and services;
                As described in our "On-line privacy practices" in Section 12 below; and
                If you ask us to, promoting, offering or marketing additional products, goods and services we offer.
                We may use personal information to create aggregate information as well.

                6. WHEN WE SHARE PERSONAL INFORMATION.
                Personal information we collect in accordance with this Privacy Policy may be shared with the Costco Affiliates, for the purposes listed above, provided that such shared information is required for and is used and disclosed for such purposes only. Personal information may also be disclosed to unaffiliated third parties in connection with the sale, assignment or other transfer of our business, in which case we will require such third parties to adhere to the terms of this Privacy Policy.
                From time to time we engage unaffiliated third parties and their affiliates, agents and subcontractors ("Service Providers") to perform certain technological or administrative services. For example, a Service Provider may be asked to perform credit card processing services or be asked to run a computer program that identifies which of our customers purchased a particular product so we can notify those customers of special programs regarding the same or similar products. We also may use a Service Provider to host and administer one or more of our Web sites, process and store data, and fulfill similar technology-related functions on our behalf. In these circumstances, the personal information that the Service Provider receives is limited to only the personal information held by us that they need in order to render their service to us. The companies that are provided with the personal information are first required to sign an agreement that obligates them to keep the information confidential and secure and prohibits them from using it for unauthorized purposes.
                We also may engage Service Providers to provide us with cloud computing services. Cloud computing is the provision of network-based services, located on remote computers, that allow individuals and businesses to use software and hardware operated by third parties. Examples of these services include online file storage, webmail and online business applications. Service Providers have policies and processes in place to ensure that the confidentiality of information in their care is properly safeguarded at all times.
                You acknowledge that Costco's e-mail systems are operated in the "cloud". Cloud computing allows businesses or individuals to use computers and software programs operated by third parties. The computers provided by Costco's current "cloud" Service Provider may be located in Canada, the United States or the European Union. Costco's current "cloud" Provider has policies and processes in place to ensure that the confidentiality of information in their care is safeguarded at all times.
                If you do not want your e-mail or any attachment stored in this manner, please do not send us your e-mail and instead call us at 1-855-622-5656 with respect to any pharmacy-related inquiries.
                By proceeding with your e-mail you confirm your consent to this manner of storage, and permit your online inquiry to be processed accordingly. You acknowledge that this Service Provider may be located in the United States or the European Union, your personal information and personal health information may be processed and stored in the United States or the European Union and the governments, courts or law enforcement or regulatory agencies of the United States or the European Union may be able to obtain disclosure of your personal information and personal health information through a lawful order made where the information is located.
                We will also disclose personal information in accordance with Section 12 below when the information is collected on-line at the Web site and/or may disclose personal information or personal health information without your knowledge or consent if a law, regulation, search warrant, subpoena or court order legally authorizes us or requires us to do so. We may also disclose personal information or personal health information to protect the rights, property or personal safety of Costco, its customers, employees or other members of the public.
                Except as set out above, we do not sell, rent, share or disclose the personal information or personal health information we hold or make our membership list available to others for a fee without your consent.

                7. WHEN WE COLLECT, HOW WE USE AND WHEN WE SHARE PERSONAL HEALTH INFORMATION.
                In the course of providing you with pharmacy-related services and programs we introduce from time to time, we collect, generate and use personal health information to provide you with the health services you request, to obtain or process payment for health services and for internal management purposes, including planning, resource allocation, policy development, quality improvement, monitoring, audit, evaluation and reporting. Your personal health information may be shared between Costco Affiliates for these purposes only. Costco and its Service Providers will not use or disclose your personal health information without your consent except in connection with (1) processing or obtaining payment for government-funded health services (for example, obtaining authorization from your insurer or provincial authorities for direct payment of pharmacy services), (2) processing or obtaining payment from your health insurance provider, (3) providing Costco with technological or administrative services as described in Section 6 above or (4) in connection with the sale, assignment or other transfer of our business, in which case we will require such third parties to adhere to the terms of this Privacy Policy. We will also disclose personal health information if a law, regulation, search warrant, subpoena or court order legally authorizes us or requires us to do so or to protect the rights, property or personal safety of Costco, its customers, employees or other members of the public. We may also be required to disclose certain personal health information in order to maintain standing with the professional bodies for pharmacists.

                8. HOW LONG DO WE HOLD PERSONAL INFORMATION AND PERSONAL HEALTH INFORMATION.
                Personal information and personal health information is retained only for so long as is necessary for the purposes set out above. When no longer required, we will destroy, erase or de-personalize the personal information. Legal requirements may necessitate our retaining some or all of the personal information and personal health information we hold for a period of time that is longer than we might otherwise hold it. However, Costco will restrict access to such information to prevent it from being used except for the fulfilment of these legal requirements.
                9. ACCURACY.
                To ensure that the personal information and personal health information you provided is accurate, complete and up-to-date, we urge you to provide us with updates regarding such information and to inform us of any errors affecting the personal information and personal health information we hold. You may update, review or correct your www.costcopharmacy.ca on-line account information at any time by accessing your password-protected registration page via the "My Account" area of the Web site. To update any other information, please call us at 1-855-622-5656, Monday to Friday 9:00 am to 5:30, Saturday closed and Sunday 12 noon to 5 pm. EST. Please note hours of operation are subject to change.

                10. SECURITY MEASURES.
                We will continue to keep in place security measures in an effort to protect personal information and personal health information held by us from unauthorized use, access, disclosure, distribution, loss or alteration. We employ physical, administrative, contractual and technological safeguards to protect personal information, and insist that our Service Providers do the same. Access to personal information and personal health information will be restricted to authorized personnel who require the information in order to perform their duties properly. In addition, access will be limited to only that information that is strictly necessary for the performance of those duties. Please also see our "On-line privacy practices" in Section 12 below.
                We periodically update our policies regarding information security measures in an effort to protect the personal information and personal health information held by us in the most effective manner possible.

                11. ACCESSING PERSONAL INFORMATION AND PERSONAL HEALTH INFORMATION.
                Our customers are entitled to access the personal information and personal health information held by us concerning them. In recognition of the importance we attach to each customer's information, you can only access personal information and personal health information we hold about you, but not personal information and personal health information about your spouse or others. Under limited circumstances, we may give you access to personal information or personal health information that we hold about others, but only if required or permitted by law (for example, a parent or guardian may, in certain instances, be given access to the personal information or personal health information of a child or a person who requires a substitute decision maker). You can access the personal information and personal health information you provided to us by either: (1) visiting us at any pharmacy counter at any Canadian Costco warehouse location, or (2) calling us at 1-855-622-5656, Monday to Friday 9:00 am to 5:30, Saturday closed and Sunday 12 noon to 5 pm. EST. Please note hours of operation are subject to change. We will generally respond to your request for information within thirty (30) days, unless, for reasons beyond our control, a longer response time is necessary, in which case you will be advised accordingly. While our response will generally be provided at no cost, you will be informed in advance of any charges that apply in connection with the information request. Charges may relate to the transcription, reproduction or transmission of personal information or personal health information held by us.
                As specifically set out under section 6 with respect to Costco's e-mail Service Provider, personal information and personal health information that you disclose to us by e-mail may be stored by Costco or Costco Affiliates in Canada, in the United States or in the European Union. You acknowledge that if Service Providers are located in the United States, or the European Union, your personal information and personal health information may be processed and stored in the United States or the European Union, and the governments, courts or law enforcement or regulatory agencies in the United States or the European Union may be able to obtain disclosure of your personal information and personal health information through a lawful order made where the information is located. If you do not want your e-mail or any attachment stored in this manner, please call 1-855-622-5656 for pharmacy-related service inquiries.
                In very limited circumstances, we may not be able to supply personal information and personal health information for reasons of a legal nature, including privileged communications between professional and client or a pending judicial proceeding. In each case, we will provide written reasons outlining why your request for access has not been granted by us.

                12. ON-LINE PRIVACY PRACTICES.
                Collection: We may collect personal information and personal health information on-line when you visit our Web site as described in Sections 4 and 7 above. In addition, we may collect cookie and web beacon information when you browse the Web site. Cookies are small files that are stored on your computer, and web beacons are electronic images that allow us to count visitors visiting certain Web pages, to access cookies, and to analyze whether advertising banners on our site or other sites were effective. At www.costcopharmacy.ca, we may use cookies and beacons to help optimize your Web site experience, to evaluate use of our Web site and to support Web site analytics. In doing so, we may collect technical information such as your IP address, your browser type, the addresses of referring Web sites, and your path through our Web site. Cookies help us to customize our Web site for you and to better display pages according to your browser type. While cookies are optional for browsing www.costcopharmacy.ca, they are required for registering, logging on, purchasing or adding items to your cart. If you wish to purchase items or set up an account onwww.costcopharmacy.ca you will need to accept a www.costcopharmacy.ca cookie. (In order to control the ability of Web site providers to place cookies on your computer, you should consult your browser's "Options" and "Help" pages to learn how to adjust your settings to suit your privacy preferences.)
                Use: We use personal information and personal health information collected on-line as described in Sections 5 and 7 above. In addition, we use personal information and personal health information: (a) to respond to your questions and concerns and to understand your needs and preferences; (b) to conduct surveys and other research; (c) to provide you with customized Web site content and advertising; (d) to fulfill your on-line orders and to facilitate product deliveries, pickups and returns; (e) to detect, prevent, or otherwise address fraud, security or technical issues, or (f) protect against harm to the rights, property or safety of Costco, its users or the public as required or permitted by law.
                Sharing: We share personal information and personal health information collected on-line as described in Sections 6 and 7 above. In addition, we may provide Service Providers with certain information that is necessary to fulfill an order you have placed with us. For example, if you request shipment for a purchase, we may provide your address to the shipping carrier and customs service provider, and if you pay by credit or debit card, your card number and sales transaction information are passed to the card processor and/or issuer (including their service providers such as fraud verification services). We also may use Service Providers to host and administer the Web site, process and store data, and fulfill other technology-related functions on our behalf. However, we only give or permit access to vendors, suppliers and other Service Providers involved in Web site administration and the commerce distribution chain the limited information needed to perform their duties and provide you with the products and services you order. We are not responsible for any additional information you provide directly to these parties.
                Protection: Personal information and personal health information we collect on our Web site is stored electronically, and may be combined with other off-line information. Personal information and personal health information entered on our Web site is encrypted using a security protocol called SSL (Secure Sockets Layer). SSL encrypts information entered on our site before it is sent over the Internet. SSL also allows you to view securely your on-line account and registration information. Account information is accessible on-line only through the use of a password. To protect the confidentiality of personal information and personal health information, you must keep your password confidential and not disclose it to any other person. You are responsible for all uses of our Web site by any person using your password. You are advised that, unlike communication within our Web site, we have no control over the privacy of your e-mail communications with us while in transit. We recommend that you do not include confidential, proprietary, personal or personal health information in e-mails, including credit card numbers, passwords, prescriptions and other similar information. Also, if other people have access to your e-mail account, they may be able to access your password and obtain personal information about you (such as your credit card information), or change information about your user profile. You should not use an e-mail account operated by your employer because many employers have the legal right to access such e-mail accounts. If you believe your password has been misused, please advise us immediately by calling us at 1-855-622-5656, Monday to Friday 9:00 am to 5:30, Saturday closed and Sunday 12 noon to 5 pm. EST. Please note hours of operation are subject to change. Please note hours of operation are subject to change.
                Children: We encourage parents to take an active interest in their children's use of the Internet. We do not intend to collect information from children who are under 18 years of age. If you are under 18, please do not provide information on our Web site. On-line links to other Web sites: Through links provided on our Web site, you can link to other Web sites of third parties who have agreed to offer goods and services to our members. Any personal information you provide on the linked pages is provided directly to that third party and is subject to that third party's privacy policy. Except as described above, we are not responsible for the content or privacy and security practices and policies of Web sites to which we provide links. Links from our site to third parties or to other sites are provided for your convenience. We encourage you to learn about their privacy and security practices and policies before providing them with personal information.

                13. COMPLAINT PROCESS.
                If you are not completely satisfied with or wish to submit comments concerning this Privacy Policy or its application by us, we invite you to convey your concerns or suggestions to Costco , 415 West Hunt Club Road, Ottawa, Ontario, Canada K2E 1C5 Attention: Privacy Officer. We will reply as quickly as possible and inform you of the steps, if any, that have been or will be taken in order to address the concern or implement the suggestion. You can also file a complaint with the Privacy Commissioner in the province in which you reside or with the Office of the Privacy Commissioner in Ottawa.


                
                I have reviewed the Costco Health Center Notice of Privacy Practices effective April 14, 2003 (the “Notice”) and understand that all my medical information will be used by Costco in accordance with the Notice.")
                """
            )
                    
                    //Toggle This
                    
                    Text("I have reviewed the Costco Health Center Notice of Privacy Practices effective April 14, 2003 (the “Notice”) and understand that all my medical information will be used by Costco in accordance with the Notice.")
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "completed")
                        self.selection = 1
                        
                    } ) { Text("Next >").font(.body).bold() }
                        .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                        .foregroundColor(Color(.white))
                        .background(Color(UIColor.mainColor))
                        .padding()
                    
                    NavigationLink(destination: HomeView(), tag: 1, selection: $selection) { EmptyView() }
                    
                }
            
        }
    }
struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
