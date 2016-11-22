Feature: AboutSections
In order to manage about_sections
As an adminuser
I want to edit, create, view about_sections

  Scenario: User can view about_sections page
    Given I am authenticated adminuser
    And about_section
    When I go to the about_sections page
    Then I should see "About the Company"

  Scenario: Adminuser can edit about_section
    Given about_section
    And I am authenticated adminuser
    When I go to the edit about_section page for "About the Company"
    And I fill in "Title" with "About section edited"
    And I press "SAVE"
    Then I should see "About section edited"

  Scenario: Adminuser can create about_section
    Given I am authenticated adminuser
    When I go to the new about_section page
    And I fill in "Title" with "My new about section"
    And I fill in "Body" with "My body"
    And I press "SAVE"
    Then I should have one about_section
    And I should see "My new about section"

  Scenario: Adminuser can not create about_section without title
    Given I am authenticated adminuser
    When I go to the new about_section page
    And I fill in "Title" with ""
    And I fill in "Body" with "My body"
    And I press "SAVE"
    Then I should have zero about_sections
    And I should see "can't be blank"
