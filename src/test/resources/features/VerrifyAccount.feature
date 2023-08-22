@Regression
Feature: Verify Account

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token
    
    #------7
  Scenario: Verify and Account   that  is exist
    Given path "/api/accounts/get-account"
    * def existingId = 9652
    And param primaryPersonId = existingId
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id== existingId
    #------8
  Scenario: Verify get-account with id not exist
    Given path "/api/accounts/get-account"
    And header Authorization = "Bearer " + validToken
    * def notExistingId = 9999999
    And param primaryPersonId = notExistingId
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " + notExistingId + " not found"
    
    #------9