Feature: Account
In order to edit account info
As an user
I want to edit account

  Scenario: User can edit account data
    Given I am authenticated user
    And I am on the admin page
    When I go to the account edit page for "test_user@sample.com"
    And I should see "Edit User"
    When I fill in "user_email" with "test@test.com"
    And I fill in "user_current_password" with "password"
    And I press "Update"
    Then I should see "Your account has been updated successfully."
    And I should be on the admin page
