Feature: Tags
In order to manage tags
As an adminuser
I want to edit, create, view tags

  Scenario: User can view tags page and tag page
    Given I am authenticated adminuser
    And tag
    When I go to the tags page
    And I should see "tag one"

  Scenario: Adminuser can edit tag
    Given tag
    And I am authenticated adminuser
    When I go to the edit tag page for "tag one"
    And I fill in "Name" with "tag edited"
    And I press "SAVE"
    Then I should see "tag edited"

  Scenario: Adminuser can create tag
    Given I am authenticated adminuser
    When I go to the new tag page
    And I fill in "Name" with "tag new"
    And I press "SAVE"
    Then I should have one tag
    And I should see "tag new"
