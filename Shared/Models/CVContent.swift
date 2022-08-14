//
//  CVContent.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 09/08/2022.
//

import Foundation
 class CVContent:ObservableObject,Codable {
   @Published var cvCode : String
   @Published var imageName:String
   @Published var name :String
   @Published var phone :String
   @Published var mail :String
   @Published var address : Address
   @Published var resumeSubTitle :String
   @Published var companyName :String
   @Published var positionUrl :String
   @Published var resumeText :String
   @Published var competencesText :String
   @Published var aboutMe : [CVItem]
   @Published var ultraResume : [CVItem]
   @Published var education : [CVItem]
   @Published var experience:[CVItem]
   @Published var studyRelatedExperience:[CVItem]
   @Published var publications:[CVItem]
   @Published var languages : [CVItem]
   @Published var frameworks :[CVItem]
   @Published var capabilities:[CVItem]


   init(){
     cvCode = ""
     imageName = "Testing_image"
     name = ""
     phone = ""
     mail = ""
     address = Address(street: "", postnumber: "", city: "", country: "")
     resumeSubTitle = ""
     companyName = ""
     positionUrl = ""
     resumeText = ""
     competencesText = ""
     aboutMe = [CVItem]()
     ultraResume = [CVItem]()
     education = [CVItem]()
     experience = [CVItem]()
     studyRelatedExperience = [CVItem]()
     publications  = [CVItem]()
     languages = [CVItem]()
     frameworks = [CVItem]()
     capabilities = [CVItem]()
   }

   init(constTexts:ConstTexts) {
     cvCode = constTexts.cvCode
     imageName = constTexts.imageName
     name = constTexts.name
     phone = constTexts.phone
     mail = constTexts.mail
     address = constTexts.address
     resumeSubTitle = constTexts.resumeSubTitle
     companyName = constTexts.companyName
     positionUrl = constTexts.positionUrl
     resumeText = constTexts.resumeText
     competencesText = constTexts.competencesText
     aboutMe = constTexts.aboutMe
     ultraResume = constTexts.ultraResume
     education = constTexts.education
     experience = constTexts.experience
     studyRelatedExperience = constTexts.studyRelatedExperience
     publications  = constTexts.publications
     languages = constTexts.languages
     frameworks = constTexts.frameworks
     capabilities = constTexts.capabilities

   }

   //  MARK: - Codable Conformance (not in extension because of the initializer)

   enum CodingKeys: CodingKey{
     case  cvCode,imageName,name,phone,mail,address ,resumeSubTitle ,companyName ,positionUrl ,resumeText ,competencesText ,aboutMe ,ultraResume ,education ,experience,studyRelatedExperience,publications,languages ,frameworks ,capabilities
   }
   // MARK: decode
   required init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)

     cvCode = try container.decode(String.self, forKey: .cvCode)
     imageName = try container.decode(String.self, forKey: .imageName)
     name = try container.decode(String.self, forKey:.name )
     phone = try container.decode(String.self, forKey:.phone )
     mail = try container.decode(String.self, forKey:.mail )
     address = try container.decode(Address.self, forKey:.address )
     resumeSubTitle = try container.decode(String.self, forKey:.resumeSubTitle )
     companyName = try container.decode(String.self, forKey:.companyName )
     positionUrl = try container.decode(String.self, forKey:.positionUrl )
     resumeText = try container.decode(String.self, forKey:.resumeText )
     competencesText = try container.decode(String.self, forKey:.competencesText )
     aboutMe = try container.decode(Array<CVItem>.self, forKey:.aboutMe )
     ultraResume = try container.decode(Array<CVItem>.self, forKey:.ultraResume )
     education = try container.decode(Array<CVItem>.self, forKey:.education )
     experience = try container.decode(Array<CVItem>.self, forKey:.experience )
     studyRelatedExperience = try container.decode(Array<CVItem>.self, forKey:.studyRelatedExperience )
     publications  = try container.decode(Array<CVItem>.self, forKey:.publications )
     languages = try container.decode(Array<CVItem>.self, forKey:.languages )
     frameworks = try container.decode(Array<CVItem>.self, forKey:.frameworks )
     capabilities = try container.decode(Array<CVItem>.self, forKey:.capabilities )
   }

   // MARK: encode

   func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)

     try container.encode(cvCode, forKey: .cvCode)
     try container.encode(imageName, forKey: .imageName)
      try container.encode(name, forKey:.name )
       try container.encode(phone, forKey:.phone )
       try container.encode(mail, forKey:.mail )
       try container.encode(address, forKey:.address )
       try container.encode(resumeSubTitle, forKey:.resumeSubTitle )
       try container.encode(companyName, forKey:.companyName )
       try container.encode(positionUrl, forKey:.positionUrl )
       try container.encode(resumeText, forKey:.resumeText )
       try container.encode(competencesText, forKey:.competencesText )
       try container.encode(aboutMe, forKey:.aboutMe )
       try container.encode(ultraResume, forKey:.ultraResume )
       try container.encode(education, forKey:.education )
       try container.encode(experience, forKey:.experience )
       try container.encode(studyRelatedExperience, forKey:.studyRelatedExperience )
        try container.encode(publications, forKey:.publications )
       try container.encode(languages, forKey:.languages )
       try container.encode(frameworks, forKey:.frameworks )
       try container.encode(capabilities, forKey:.capabilities )
   }



}
