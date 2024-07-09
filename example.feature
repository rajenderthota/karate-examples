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

    * def iterateAndPrintPosts = 
    """
    function(posts) {
        var postCount = posts.length;
        karate.log('Total posts:', postCount);
        for (var i = 0; i < postCount; i++) {
            karate.log('Post', i + 1, ':', posts[i]);
        }
    }
    """

    * call iterateAndPrintPosts(posts)
