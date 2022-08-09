//
//  Tests_AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 09/08/2022.
//

import XCTest
import Firebase

class Tests_AuthenticationHandler: XCTestCase {
  
  override func setUpWithError() throws {

  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAuthenticationHandlerCanBeInitialized() throws {
    //given
    class MockAuth:Auth {
      //do some mock here

    }
    //when
    let sut = AuthenticationHandler()
    //then
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  func testUnknownUser(){
    //given
    let sut=AuthenticationHandler()
    let email="unknown@unknown.unknown"
    let password = "nilnil"
    //when
    sut.loginToExistingCV(email: email, cvname: password)
    //then
    XCTAssertFalse(sut.isLoggedIn)
  }

  func testBadLoginCredentialsEmailFormat(){
    //given
    let sut=AuthenticationHandler()
    
    let email="unknown@unknown"
    let password = "nilnil"
    //when
    sut.loginToExistingCV(email: email, cvname: password)
    //then
    XCTAssertFalse(sut.isLoggedIn)
    XCTAssertNotEqual(nil, sut.stateMessage, "message is set to something")
    XCTAssertNotEqual("Signed In", sut.stateMessage, "message is not \"Signed In\" ")
    XCTAssertNotNil(sut.stateMessage?.contains("no user record"))
  }
  
  func testBadLoginCredentialsPasswordFormat(){
    //given
    let sut=AuthenticationHandler()
    
    let email="unknown@unknown.unknown"
    let password = "nilni"
    //when
    sut.loginToExistingCV(email: email, cvname: password)
    //then
    XCTAssertFalse(sut.isLoggedIn)
    XCTAssertNotNil(sut.stateMessage?.contains("password"))
  }
  
  func testLoginSuccess(){
    //given
    let sut=AuthenticationHandler()
    
    let email="1@2.dk"
    let password = "123456"
    //when
    sut.loginToExistingCV(email: email, cvname: password)
    //then
    XCTAssertTrue(sut.isLoggedIn)
    XCTAssertEqual(sut.stateMessage, "Signed In")
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
