Feature: As a ninja developer
  I want to have a FruityMesh development environment ready
  So that I can write the next mesh killer-app

  Scenario: Having a VM to develop FruityMesh apps
    Given I have a vm at "fruity"
    When log on as "deploy"
    Then I can build the "fruitymesh" image
    And I see the result


