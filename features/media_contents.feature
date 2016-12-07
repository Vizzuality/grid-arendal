Feature: Media contents
In order to manage media contents
As an adminuser
I want to edit, create, view media contents

  Scenario: User can view media contents page
    Given I am authenticated adminuser
    And I stub flickr
    And photo content
    And album content
    When I go to the media contents page
    And I should see "My photo"

  Scenario: Adminuser can edit media content without attachment
    Given album content
    And I am authenticated adminuser
    And I stub flickr
    When I go to the edit media content page for "My album"
    And I fill in "Title" with "Album edited"
    And I press "SAVE"
    Then I should see "Album edited"

  Scenario: Adminuser can edit photo content with photo
    Given I am authenticated adminuser
    And I stub flickr
    When I follow new photo on the new media content page
    And I fill in "Title" with "Photo new"
    And I attach the file "features/upload_files/album-sample.jpg" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "SAVE"
    Then I should have one photo
    When I follow photo on the edit media content page for "Photo new"
    And I fill in "Title" with "Photo edited"
    And I attach the file "features/upload_files/album-sample.jpg" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "SAVE"
    Then I should see "Photo edited"
    And I follow "Delete"
    Then I should have zero media contents

  Scenario: Adminuser can edit album content with photo
    Given I am authenticated adminuser
    When I follow new album on the new media content page
    And I fill in "Title" with "Album new"
    And I fill in "Description" with "Lorem ipsum"
    And I press "SAVE"
    Then I should have one album
    And I should see "Album new"
    And I go to the edit media content page for "Album new"
    And I fill in "Title" with "Album edited"
    And I fill in "Description" with "Lorem ipsum"
    And I press "SAVE"
    Then I should see "Album edited"
    And I follow "Delete"
    Then I should have zero media contents

  Scenario: Adminuser can create and delete media content photo
    Given I am authenticated adminuser
    And I stub flickr
    When I follow new photo on the new media content page
    And I fill in "Title" with "Photo new"
    And I attach the file "features/upload_files/album-sample.jpg" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "SAVE"
    Then I should have one photo
    And I should see "Photo new"
    When I follow "Delete"
    Then I should have zero media contents
    And I should be on the new media content page
    And I should not see "Photo new"

  Scenario: Adminuser can not create media content without title
    Given I am authenticated adminuser
    And I stub flickr
    When I go to the new media content page
    And I fill in "Title" with ""
    And I press "SAVE"
    Then I should have zero media contents
    And I should see "can't be blank"

  @javascript
  Scenario: Publisheruser can publish and unpublish an media content
    Given I am authenticated publisheruser
    And I stub flickr
    And second photo content
    And album content
    When I go to the media contents page
    Then I should see "Second photo"
    When I click on overlapping ".Unpublish"
    And I wait for the ajax request to finish
    Then I should see "Second photo"
    And I should have one unpublished media content
    When I click on overlapping ".Publish"
    And I wait for the ajax request to finish
    And I should see "Second photo"
    And I should have one published media content
