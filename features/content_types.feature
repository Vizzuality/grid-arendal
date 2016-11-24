Feature: Content Types
In order to manage content types
As an adminuser
I want to edit, create, view content types

  Scenario: User can view content types page and content type page
    Given I am authenticated adminuser
    And content type
    When I go to the content types page
    And I should see "Content Type one"

  Scenario: Adminuser can edit content type
    Given content type
    And I am authenticated adminuser
    When I go to the edit content type page for "Content Type one"
    And I fill in "Title" with "Content Type edited"
    And I press "SAVE"
    Then I should see "Content Type edited"

  Scenario: Adminuser can create content type
    Given I am authenticated adminuser
    When I go to the new content type page
    And I fill in "Title" with "Content Type new"
    And I press "SAVE"
    Then I should have one content type
    And I should see "Content Type new"

  Scenario: Adminuser can not create content type without name
    Given I am authenticated adminuser
    When I go to the new content type page
    And I fill in "Title" with ""
    And I press "SAVE"
    Then I should have zero content types
    And I should see "can't be blank"
