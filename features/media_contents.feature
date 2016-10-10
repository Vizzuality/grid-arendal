Feature: Media contents
In order to manage media contents
As an adminuser
I want to edit, create, view media contents

  Scenario: User can view media contents page
    Given I am authenticated adminuser
    And photo content
    And album content
    When I go to the media contents page
    And I should see "My photo"

  Scenario: Adminuser can edit media content
    Given album content
    And I am authenticated adminuser
    When I go to the edit media content page for "My album"
    And I fill in "Title" with "Album edited"
    And I press "Update"
    Then I should see "Album edited"

  Scenario: Adminuser can create media content
    Given I am authenticated adminuser
    When I go to the new media content page
    And I fill in "Title" with "Photo new"
    And I press "Create media content"
    Then I should have one media content
    And I should see "Photo new"

  Scenario: Adminuser can not create media content without title
    Given I am authenticated adminuser
    When I go to the new media content page
    And I fill in "Title" with ""
    And I press "Create media content"
    Then I should have zero media contents
    And I should see "can't be blank"

  Scenario: Publisheruser can publish and unpublish an media content
    Given I am authenticated publisheruser
    And photo content
    And album content
    When I go to the media contents page
    Then I should see "My photo"
    When I follow "Unpublish"
    Then I should be on the media contents page
    And I should see "My photo"
    And I should see "Publish"
    When I follow "Publish"
    Then I should be on the media contents page
    And I should see "My photo"
    And I should see "Unpublish"
