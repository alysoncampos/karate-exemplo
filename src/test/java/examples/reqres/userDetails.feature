Feature: fetching User Details

    Background:
        * url 'https://reqres.in/api'

    Scenario: get the first resource by id
        Given path 'unknown'
        When method get
        Then status 200

        * def resource =  response.data[0]

        Given path 'unknown', resource.id
        When method get
        Then status 200
        And match $.data contains {id:1}

    Scenario: testing the get call for User Details
        Given path 'users/2'
        When method get
        Then status 200
        And match $.data contains {id:2}