@Smoke
Feature: Security Token Tests

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  #--------1
  Scenario: Generate valid token with valid username and password
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  #--------2
  Scenario Outline: Validate token with invalid username
    And request
      """
      {
      "username": "<username>",
      "password": "<password>"
      }
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "<errorMessage>"

    #--------3
    Examples: 
      | username   | password       | errorMessage         |
      | wrong      | tek_supervisor | User not found       |
      | supervisor | wrong          | Password Not Matched |

