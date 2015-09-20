Feature: VM is created

  Background:
    Given I have a vm at "stage.newsalertapp.com"

  Scenario: Adding users
    Then I can log on as "deploy"

  Scenario: Accessing the web
    When I start the web service
    And I navigate to it
    Then I see "NewsAlert Web Access"
