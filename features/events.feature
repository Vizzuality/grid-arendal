Feature: Events
In order to manage events
As an adminuser
I want to edit, create, view events

  Scenario: User can view events page and event page
    Given I am authenticated adminuser
    And event
    When I go to the events page
    And I should see "Event one"

  Scenario: Adminuser can edit event
    Given event
    And I am authenticated adminuser
    When I go to the edit event page for "Event one"
    And I fill in "Title" with "Event edited"
    And I press "SAVE"
    Then I should see "Event edited"

  Scenario: Adminuser can create event
    Given I am authenticated adminuser
    When I go to the new event page
    And I fill in "Title" with "Event new"
    And I press "SAVE"
    Then I should have one event
    And I should see "Event new"

  Scenario: Adminuser can not create event without name
    Given I am authenticated adminuser
    When I go to the new event page
    And I fill in "Title" with ""
    And I press "SAVE"
    Then I should have zero events
    And I should see "can't be blank"
