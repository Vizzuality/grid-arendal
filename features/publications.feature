Feature: Publications
In order to manage publications
As an adminuser
I want to edit, create, view publications

  Scenario: User can view publications page
    Given I am authenticated adminuser
    And publication
    When I go to the publications page
    Then I should see "My publication"

  Scenario: Adminuser can edit publication
    Given publication
    And I am authenticated adminuser
    When I go to the edit publication page for "My publication"
    And I fill in "Title" with "Publication edited"
    And I press "Update"
    Then I should see "Publication edited"

  Scenario: Adminuser can create publication
    Given I am authenticated adminuser
    And partner
    When I go to the new publication page
    And I fill in "Title" with "My new publication"
    And I fill in "Description" with "My description"
    And I select "Gonca A." from "Users"
    And I select "Partner one" from "Partners"
    And I press "Create Publication"
    Then I should have one publication
    And I should see "My new publication"

  Scenario: Adminuser can not create publication without title
    Given I am authenticated adminuser
    And partner
    When I go to the new publication page
    And I fill in "Title" with ""
    And I fill in "Description" with "My description"
    And I select "Partner one" from "Partners"
    And I press "Create Publication"
    Then I should have zero publications
    And I should see "can't be blank"

  Scenario: Publisheruser can publish and unpublish an publication
    Given I am authenticated publisheruser
    And publication
    When I go to the publications page
    Then I should see "My publication"
    And I follow "Unpublish"
    Then I should be on the publications page
    And I should see "My publication"
    And I should see "Publish"
