Feature: Home page
In order to view homepage
As an user
I want to follow links

  Scenario: User will be redirect to login page and back to new actor page after following create actor on homepage
    Given I am registrated user
    And I am on the admin page
    Then I should be on the login page
    And I fill in "Email" with "test-user@sample.com"
    And I fill in "Password" with "password"
    And I press "LOGIN"
    Then I should see "Signed in successfully."
    And I should be on the admin page
