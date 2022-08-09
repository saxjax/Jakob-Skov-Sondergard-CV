//
//  CVContent.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 09/08/2022.
//

import Foundation
struct CVContent:Codable {
  var cvCode : String
  var name :String
  var phone :String
  var mail :String
  var address : Address


  var resumeSubTitle :String
  var companyName :String
  var positionUrl :String
  var resumeText :String
  var competencesText :String
  var aboutMe : [CVItem]
  var ultraResume : [CVItem]
  var education : [CVItem]
  var experience:[CVItem]
  var studyRelatedExperience:[CVItem]
  var publications:[CVItem]
  var languages : [CVItem]
  var frameworks :[CVItem]
  var capabilities:[CVItem]

  init(constTexts:ConstTextsObserved) {
    cvCode = constTexts.cvCode
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
}
