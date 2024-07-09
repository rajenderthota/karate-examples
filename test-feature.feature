Feature: Using responses from one scenario as input to another scenario

  Scenario: Get user details
    Given url 'https://jsonplaceholder.typicode.com/users/1'
    When method get
    Then status 200
    And def userResponse = response

  Scenario: Use user details in another scenario
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request { userId: userResponse.id, title: 'foo', body: 'bar' }
    When method post
    Then status 201
