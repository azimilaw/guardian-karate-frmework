@Regression
Feature: Add phone number

  Background: set up
    Background: setup test and get valid token

    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createaccount = callonce read('CreateAccount.feature')
    * def validToken = createaccount.validToken
    * def primaryAccountid = createaccount.response.id
    * def BearerToken = "Bearer "+validToken

  Scenario: adding phone number to account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = primaryAccountid
    And header authorization = BearerToken
    * def generateDataObject = Java.type('api.utility.data.GenerateData')
    * def randomphonenumber = generateDataObject.randomphonenumber
    And request
      """
      {
      
       "phoneNumber": "#(randomphonenumber)",
       "phoneExtension": "",
       "phoneTime": "morning",
       "phoneType": "Iphone"
      }
      """
    When method post
    Then status 500
