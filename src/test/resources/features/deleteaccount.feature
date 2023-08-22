@Regression
 Feature:   Deleteaccount
 

 Background: setup test and get valid token
	Given url "https://tek-insurance-api.azurewebsites.net"
	* def createaccount = callonce read('CreateAccount.feature')
	* def validToken = createaccount.validToken
	* def primaryAccountid = createaccount.response.id
	* def BearerToken = "Bearer "+validToken
	And print createaccount 
	Given url "https://tek-insurance-api.azurewebsites.net"
	Scenario: delete account that exist
	Given path "/api/accounts/delete-account"
	And header Authorization = BearerToken
	And param primaryPersonId = primaryAccountid
	When method delete
	Then status 200
	And print response
	Given path "/api/accounts/delete-account"
	And header Authorization = BearerToken
	And param primaryPersonId = primaryAccountid
	When method delete
	Then status 404
	And print response
 And assert response.errorMessage == "Account with id "+primaryAccountid+" not exist"
 