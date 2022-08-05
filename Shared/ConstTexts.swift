//
//  ConstTexts.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import Foundation
struct ConstTexts{
    static let aboutMe = [
        CVItem(id: 1, title: "Me and Programming", body: """
    My big programming passion lays in apples ecosystem of devices and the Swift programming language.
    I appreciate the process of building tools that help people solving tasks of any kind, and this passion is what drove me towards a carrier change from performing arts into building "stuff".
    """),

        CVItem(id: 0, title: "I am fresh from school with 20+ years of working experience, big kids, lots of energy and I love learning new stuff.", body: """
    I am a creative teamplayer with 20+ years of experience in living from collaborative creativity as a composer, musician and actor in groups of all sorts.
    I love inventing, I love working , I love diving deep into whatever I work with and I thrive in a loose informal environment with a Disney approach to ideation.
    I believe in iterative learning by doing and in iterative development, learning from mistakes, always aiming for a better customer experience.
    I tend to blend in well, and find it easy to work in teams, respecting that all team members bring valuable competences.
    """)

    ]
    static let ultraResume = [
        CVItem(id: 16, title: """
2021-Present
Freelance Product owner and Software engineer on product NOTIO at NOVIA

"""
               , body: nil),
        CVItem(id: 15, title: """
2019-2022
Student at AAU Software Engineering

"""
               , body: nil),
        CVItem(id: 14, title: """
2017
Released my first app on the app store saxjax tuner

"""
               , body: nil),
        CVItem(id: 13, title: """
2015-2021
Actor and musician at Himmerlands Theatre

"""
               , body: nil),
        CVItem(id: 12, title: """
2015-2020
Composer for theatre plays

"""
               , body: nil),
        CVItem(id: 11, title: """
2013-2019
Saxophone teacher at Aalborg Kulturskole

"""
               , body: nil),
        CVItem(id: 9, title: """
2013-2015
Freelance work as IT supporter at Intelligent Systems

"""
               , body: nil),
        CVItem(id: 8, title: """
2013
Educated IT-Supporter

"""
               , body: nil),
        CVItem(id: 7, title: """
2000-2022
Lots of gigs with
    Jazz,
    Rock,
    Classical,
    Avantgarde,
    Kandis,
    theatre and more

"""
               , body: nil),
        CVItem(id: 6, title: """
2004-2020
Lots og gigs with medieval middleaged jester-punk boy-band \"Ramashang\" for 16 years

"""
               , body: nil),
        CVItem(id: 5, title: """
2009
Caught interest in building IOS applications  (objective C)

"""
               , body: nil),
        CVItem(id: 4, title: """
2008
Rewarded Danish Music Award with Martin Lutz Group

"""
               , body: nil),
        CVItem(id: 3, title: """
2005
Rewarded Nordjysk Jazzname of the year 2005

"""
               , body: nil),
        CVItem(id: 2, title: """
2004
Educated saxophone player from Nordjysk musikkons

"""
               , body: nil),
        CVItem(id: 1, title: """
1989
Kalahari desert Botswana as a child

"""
               , body: nil),
        CVItem(id: 0, title: """
1976
Born in Århus

""",
               body: nil)
    ]
    static let education = [
        CVItem(id: 0,
               title: "June 2022 Aalborg",
               body: """
Aalborg University, Aalborg
Bachelor of Science (BSc) in Software.

GPA: ≈ 10.3
(Based on the Danish 7-point scale)

"""),
        CVItem(id: 1,
               title: "Sept 2013 Aalborg",
               body: """
               TechCollage Aalborg
               IT-Supporter
    """),
        CVItem(id: 2,
               title: "June 2004 Aalborg",
               body: """
Nordjysk Musikkonservatorium,
Master of Music
"""
              )
    ]
    static let experience:[CVItem] = [
        CVItem(id:0,
               title:"""
Software Engineer | Novia, Jakobsstad Finland.
jan 2021-present
""",
               body:"""
Responsible for further development and maintenance of the React JS web app NOTIO.
Including system design, work planning, product vision, aligning customer expectation to available budget, continuous integration, setting milestones  and building releases using Netlify.
"""),
        CVItem(id:1,
               title: """
Software Engineer | Private projects.
2018-Present
""",
               body: """
-Saxjax Tuner-
"Designed, implemented and shipped an IOS application (Saxjax tuner) to app-store allowing users from around the world to intelligently track their pitch-tuning on wind instruments, and teaching students about pitch.
Utilising hardware interaction through the external library AudioKit.
This is an ongoing project that I intend to refactor using SwiftUI, and the MVVM pattern implementing the knowledge I have gained during my study.

-Saxjax Den lille tabel-
Designed, developed and shipped a simple math learning IOS application (saxjax Den Lille Tabel) for learning kids the multiplication tables.

-Jakob Skov Søndergård CV-
This little app that you are looking at is developed in swiftUI.
""")
    ]
    static let studyRelatedExperience:[CVItem] = [
                                    CVItem(id:0,
                                        title:"""
                                    Student Software Engineer | Turf Tank, Hjoerring.
                                    3rd semester sept 2020-Jan 2021
                                    """,
                                        body:"""
                                    Designed and implemented a Xamarin Forms mobile application to ease the registering of robotic parts in the production.
                                    The app was developed by following an Agile software engineering process incorporating several aspects of Scrum and user-interactive testing.
                                    The application followed a conventional Model-View-Viewmodel (MVVM) architectural design pattern.
                                    """
                                                 ),

                                    CVItem(id:1,
                                        title:"""
                                    Student Software Engineer | Private customer, Aalborg.
                                    6th semester feb 2022 - jun 2022
                                    """
                                        ,body:"""
                                    -Washee-
                                    Designed implemented and deployed a washroom management system Washee consisting of  mobile applications for IOS and Android, a Jango webserver and a Raspberry Pi power-relay controller.
                                    The app was developed following agile principles, incorporating extensive testing and user interviews.
                                    The mobile-app is a cross-platform Flutter application adhering to state-of-the-art software design pattern ‘Clean Architecture’ incorporating technologies such as, HTTP requests and REST principles.

                                    Details can be found on our github wiki: https://github.com/MartinBruun/P6/wiki
                                    """)
    ]
    static let publications:[CVItem] = [
                                  CVItem(id:0,
                                         title:"""
                                    Bachelor’s Project - AI-driven smart washing machines,
                                    22/06/2022-Aalborg University Project Library
                                    """,
                                         body:"""
                                    6th semester project(referred to above as Washee).
                                    During this project we primarily worked with cyber-physical systems as we implemented an intelligent solution for booking and managing washing machines in large apartment buildings.
                                    The system consists of a Webserver, a cross-platformmobile app and a power-relay-controler.
                                    the components communicate via the HTTP protocol over wifi and cellular.

                                    The crossplatform mobile app is developed in Flutter using Dart and the Web-server and the Controller is developed in python using flask, Django and postgresql.
                                    We did the automated testing using pytest and flutter_test automated through githubs CI/CD.

                                        Wiki link: https://github.com/MartinBruun/P6/wiki

                                        GitHub code: https://github.com/MartinBruun/P6.git

                                    """)
                                  ,
                                  CVItem(id:1,
                                         title:"""
                                        aSTEP – Aalborg University’s Spatial-Temporal Data Analytics Platform,
                                        02/09/2021 -Aalborg University Project Library
                                        """,
                                         body:"""
                                    5th semester project.
                                    The objectives of this project are machine learning and cross-group collaboration.
                                    This is a so-called “mega project” in which 14 groups collaborate on the same code for the same platform.

                                    aSTEP is a data analytics platform that supports a wide variety of data analytics and data-driven decision making such as intelligent transportation systems recommending fuel efficient or “green”
                                    environmental beneficial route alternatives for drivers or couriers.
                                        Wiki link: https://wiki.astep-dev.cs.aau.dk/
                                    """),
                                  CVItem(id:2,
                                         title:"""
                                  Outstanding G – an alternative to G-code,
                                  23/06/2021 – Aalborg University Project Library
                                  """,
                                         body:"""
                                  4th semester project report.
                                  We designed and created a new optimised version of the G-code language allowing CNC machinists to debug G-code errors a lot more efficiently.
                                  Besides designing the language, we also created a compiler for running programs written in OG.

                                    GitHub code: https://github.com/saxjax/uni-4th-semester.git
                                  """),
                                  CVItem(id:3,
                                         title:"""

                                  Turf Tank Registration Application,
                                  01/23/2021 – Aalborg University Project Library
                                  """,
                                         body:"""
                                  3rd semester project report.
                                  We collaborated with a robotics company to help them ease the process of assembling and registering the various components of the robot in the production.
                                  The collaboration revolved around an agile software engineering process with an extensive focus on sprints and user feedback.

                                    GitHub code: https://github.com/saxjax/uni-3rd-semester.git
                                  """),
                                  CVItem(id:4,
                                         title:"""

                                  GroupHub: A tool for dissemination and verification of knowledge ,
                                  05/27/2020 – Aalborg University Project Library
                                  """,
                                         body:"""
                                  2nd semester project report.
                                  We designed and implemented a web-platform for students to train and improve their current knowledge on various courses taught in the semester.
                                  Students would create and answer quizzes and track their progress as they prepared for the exams.
                                  OBS: report is in Danish.

                                    GitHub code: https://github.com/saxjax/uni-2nd-semester.git
                                  """),

                                  CVItem(id:5,
                                         title:"""

                                  Energy Awareness: A system for gaining awareness of electricity usage in households ,
                                  12/18/2019 – Aalborg University Project Library
                                  """,
                                         body:"""
                                  1st semester project report.
                                  We designed and implemented a simple console application written in C.
                                  The application would synthesize a large data sheet containing information regarding electricity prices and then make estimates for when the prices would be low and high, respectively.
                                  Thus, informing a possible consumer when to use electricity throughout the day.
                                  OBS: report is in Danish.
                                  """)
    ]
    static let languages = [
        CVItem(id: 0, title: "", body: "Swift"),
        CVItem(id: 1, title: "", body: "SwiftUI"),
        CVItem(id: 2, title: "", body: "Dart and Flutter"),
        CVItem(id: 3, title: "", body: "C#"),
        CVItem(id: 4, title: "", body: "C"),
        CVItem(id: 5, title: "", body: "JavaScript"),
        CVItem(id: 6, title: "", body: "Python"),
        CVItem(id: 7, title: "", body: "PowerShell"),


    ]
    static let frameworks = [
        CVItem(id: 0, title: "Xcode", body: "including Interface builder, auto layout, SwiftUI with previews, Playground,  debugging, CreateML, Extensions and protocols, delegates, pods, swift package manager, Publishing to the app store and more."),
        CVItem(id: 1, title: "React.js", body: "including portals, callbacks, jest, node, sass, BEM-naming."),
        CVItem(id: 2, title: "Flutter framework", body: " "),
        CVItem(id: 3, title: "Xamarin Forms Framework", body: ""),
        CVItem(id: 4, title: ".Net Framework", body: ""),
        CVItem(id: 5, title: "flask", body: ""),
        CVItem(id: 6, title: "Git", body: ""),
        CVItem(id: 7, title: "Firebase", body: "FireStore, and authentication"),
        CVItem(id: 8, title: "Visual Studio", body: ""),
        CVItem(id: 9, title: "Visual Studio Code", body: "This is my preferred IDE for JavaScript and Python"),
    ]
    static let capabilities:[CVItem] = [
        CVItem(id:0,title:"Project Management",
                                         body:"""
    Trello
    Github projects
"""),CVItem(id:0,title:"Communication & Language Skills:",
            body:"""
    Public speaking - performed as a professional entertainer, actor and musician for 20+ years. I have worked for Copydan as a consultant making presentations for the teachers on 10-20 schools around in Denmark 14 days in August for several years.
        Speaks and writes Danish and English.
"""),CVItem(id:0,title:"Research & Writing:",
            body:"""
        I have experience in writing academic reports in LaTeX.
""")
    ]


}
