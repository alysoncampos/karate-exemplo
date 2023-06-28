Feature: fetching User Details

    Background:
        * url 'https://reqres.in/api'

    Scenario: testing valid GET endpoint
        Given path 'users'
        When method get
        Then status 200

    Scenario: testing the exact response of a GET endpoint
        Given path 'users/1'
        When method get
        Then status 200
        And match $.data.email == "george.bluth@reqres.in"

    Scenario: testing that GET response contais specifics fields
        Given path 'users/1'
        When method get
        Then status 200
        And match $.data contains {id:1, first_name:"George", last_name:"Bluth"}

    Scenario: testing GET request exact response
        Given path 'users/1'
        When method get
        Then status 200
        And match $.data contains {id:"#notnull", first_name:"George"}

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

    Scenario: testing a POST endpoint with request body
        Given path 'users'
        And request {"name":"alyson", "job":"qa enginer"}
        When method post
        Then status 201
        And match $ contains {createdAt:"#notnull"}