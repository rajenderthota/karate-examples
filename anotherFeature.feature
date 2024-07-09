Feature: Another Feature

  Scenario: Use user details
    * def userResponse = karate.get('userResponse')
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request { userId: userResponse.id, title: 'foo', body: 'bar' }
    When method post
    Then status 201
