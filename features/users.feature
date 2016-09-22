Feature: Users
In order to manage users
As an adminuser
I want to edit, view, activate, deactivate and make a user admin

  Scenario: User can view users page and user page
    Given I am authenticated user
    And adminuser
    When I go to the users page
    And I should see "Pepe Moreno"
    And I should see "Juanito"
    When I follow "Pepe Moreno (activated)"
    Then I should be on the user page for "test_user@sample.com"
    And I should see "Pepe Moreno"

  Scenario: Adminuser can edit user
    Given user
    And I am authenticated adminuser
    When I go to the edit user page for "pepe-moreno@sample.com"
    And I fill in "user_first_name" with "Don"
    And I fill in "user_last_name" with "Morenito"
    And I fill in "user_email" with "don-morenito@sample.com"
    And I press "Update"
    Then I should see "Don Morenito"

  Scenario: Adminuser can make user admin
    Given user
    And I am authenticated adminuser
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Make admin"
    Then I should have two adminusers

  Scenario: Adminuser can remove admin rights from user
    Given user
    And I am authenticated adminuser
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Make admin"
    Then I should have two adminusers
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Make member"
    Then I should be on the users page
    And I should have one adminuser

  Scenario: Adminuser can make user publisher
    Given user
    And I am authenticated adminuser
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Make publisher"
    Then I should have one publisheruser

  Scenario: Adminuser can remove publisher rights from user
    Given publisheruser
    And I am authenticated adminuser
    Then I should have one publisheruser
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Make member"
    Then I should be on the users page
    And I should have zero publisherusers

  Scenario: Adminuser can deactivate and activate user and using active filter
    Given publisheruser
    And I am authenticated adminuser
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Deactivate"
    Then I should be on the users page
    And I should see "Pepe Moreno (deactivated)"
    When I filter active on the users page
    Then I should not see "Pepe Moreno"
    When I filter inactive on the users page
    Then I should not see "(activated)"
    When I go to the user page for "pepe-moreno@sample.com"
    And I follow "Activate"
    Then I should be on the users page
    And I should not see "(deactivated)"
