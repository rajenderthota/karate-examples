Feature: Calling another feature and using the response

  Scenario: Get user details
    Given url 'https://jsonplaceholder.typicode.com/users/1'
    When method get
    Then status 200
    And def userResponse = response

  Scenario: Use user details in another feature
    * def userResponse = call read('anotherFeature.feature') { userResponse: userResponse }
