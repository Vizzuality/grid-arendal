Feature: New User
In order to create account for a user
As an adminuser
I want to create user

  Scenario: User registration without activation
    Given I am authenticated adminuser
    And I am on the new user page
    When I fill in "Email" with "user1@sample.com"
    And I select "publisher" from "Role"
    And I press "Create user"
    Then I should be on the users page
    And I should have one publisheruser
    And "user1@sample.com" should receive no email

  Scenario: User registration with activation
    Given I am authenticated adminuser
    And I am on the new user page
    When I fill in "Email" with "user1@sample.com"
    And I fill in "Firstname" with "James"
    And I fill in "Lastname" with "Brown"
    And I fill in "Organization" with "Arendal"
    And I fill in "Position" with "GM"
    And I select "publisher" from "Role"
    And I check "user_active"
    And I press "Create user"
    Then I should be on the users page
    And I should have one publisheruser
    And I should have sign_in_count zero for "user1@sample.com"
    And I should have reset_password_token for "user1@sample.com"
    And "user1@sample.com" should receive an email
