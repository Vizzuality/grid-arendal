Feature: Partners
In order to manage partners
As an adminuser
I want to edit, create, view partners

  Scenario: User can view partners page
    Given I am authenticated adminuser
    And partner
    When I go to the partners page
    And I should see "Partner one"

  Scenario: Adminuser can edit partner
    Given partner
    And I am authenticated adminuser
    When I go to the edit partner page for "Partner one"
    And I fill in "Name" with "Partner edited"
    And I press "Update"
    Then I should see "Partner edited"

  Scenario: Adminuser can create partner
    Given I am authenticated adminuser
    When I go to the new partner page
    And I fill in "Name" with "Partner new"
    And I fill in "Web url" with "partner-new-sample.org"
    And I press "Create Partner"
    Then I should have one partner
    And I should see "Partner new"

  Scenario: Adminuser can not create partner without name
    Given I am authenticated adminuser
    When I go to the new partner page
    And I fill in "Name" with ""
    And I fill in "Web url" with "partner-new-sample.org"
    And I press "Create Partner"
    Then I should have zero partners
    And I should see "can't be blank"
