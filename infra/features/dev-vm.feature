Feature: As a ninja developer
  I want to have a FruityMesh development environment ready
  So that I can write the next mesh killer-app

  Scenario Outline: Having a VirtualBox Ubuntu VM to develop FruityMesh apps
    Given I use <provider> to create a vm at <host>
    When log on as "deploy"
    Then I can build the "fruitymesh" image
    And I see the result

    Examples:
    | provider      | host          |
#    | "VirtualBox"  | "fruity-vb"   |
    | "Parallels"   | "fruity-pvm"  |
