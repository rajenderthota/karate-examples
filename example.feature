Feature: Display response and loop example

  Scenario: Display user response and loop through posts
    Given url 'https://jsonplaceholder.typicode.com/users/1'
    When method get
    Then status 200
    And print 'User Response:', response
    
    * def userId = response.id
    
    Given url 'https://jsonplaceholder.typicode.com/posts?userId=' + userId
    When method get
    Then status 200
    And print 'Posts Response:', response
    
    * def posts = response
    
    * print 'Iterating through posts'
    * karate.forEach(posts, function(post, index) {
    *   print 'Post', index + 1, ':', post
    * })
