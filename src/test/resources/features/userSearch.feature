Feature: Validate the usersearch functionality for the APIs

  @testApi
  Scenario: Call users end point and check response code
    Given I create payload for users
    When I send https request as "Get" for "getUsersAPI"
    And I request list of users
    Then the status code is 200

  @testApi
  Scenario: User should be able to get details when search any valid user with username
    When User sends "GET" request to endpoint "/users"
    Then a 201 status code is returned
    Then Verifies that response content type is "application/json; charset=utf-8"
    And Verifies the a record with username "Delphine"
    And "name" in response body is "Glenna Reichert"
    And "id" in response body is "9"
    When I Search for the post written by the user
    And I calls "getPostAPI" with "Get" http request
    Then the status code is 200

  @testApi
  Scenario: User should not be able to get details when search any invalid user with username
    When User sends GET request to endpoint "/users"
    Then a 200 status code is returned
    Then Verifies that response content type is "Then Verifies that response content type is "application/json; charset=utf-8""
    And Verifies there is no record with username "Raman"

  @testApi
  Scenario: User should be able to search for the posts written by any user
    When User is able to GET endpoint "/posts" written by username "Delphine"
    Then a 200 status code is returned
    Then Verifies that response content type is "application/json; charset=utf-8"
    And user validats the 10 posts

  @testApi
  Scenario: User should not be able to search for the posts written by invalid user
    When User is able to GET endpoint "/posts" written by username "Yilmaz"
    Then a 200 status code is returned
    Then the response content type is "application/json; charset=utf-8"
    And user validats the 0 posts

  @testApi
  Scenario Outline: Validate all posts'comments e-mails is proper format for a username
    When User is able to GET all comments for each posts written by username "<username>"
    Then a 200 status code is returned
    And the response content type is "application/json; charset=utf-8"
    And Validate "email" address format in comments sections

    Examples:
      | username |
      | Delphine |
      | Samantha |
      | Karianne |
