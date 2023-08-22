@Regression
 Feature: Create Account feature
 
Background: setup andget valid token
		Given url "https://tek-insurance-api.azurewebsites.net"
	* def tokenFeatureResult = callonce read('GenerateToken.feature')
	And print tokenFeatureResult
	* def validToken = tokenFeatureResult.response.token
	Scenario: create valid account
	
	Given path "/api/accounts/add-primary-account"
	And header Authorization = "Bearer "+ validToken
	* def generateDataObject = Java.type('api.utility.data.GenerateData')
	* def autoEmail = generateDataObject.getEmail();
	And request
	"""{
  "email": "#(autoEmail)",
  "firstName": "Habib",
  "lastName": "safi",
  "title": "mr",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "string",
  "dateOfBirth": "2023-08-08T01:17:51.898Z",
  "new": true
}
"""
When method post
Then status 201
And print response
And assert response.email == autoEmail

