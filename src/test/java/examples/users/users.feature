Feature: sample karate test script

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200
    And match $.name == "Leanne Graham"

  Scenario: create a user and then get it by id
    * def user =
    """
    {
      "name": "Alyson QA",
        "username": "alysonqa",
        "email": "alyson_qa@user.com",
        "address": {
          "street": "Rua Um",
          "suite": "Apt. 123",
          "city": "Recife",
          "zipcode": "54321-6789"
        }
    }
    """
    Given path 'users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    Given path 'users', id
    # When method get
    # Then status 200
    # And match response constains user
