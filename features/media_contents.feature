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

  Scenario: Adminuser can edit media content without attachment
    Given album content
    And I am authenticated adminuser
    When I go to the edit media content page for "My album"
    And I fill in "Title" with "Album edited"
    And I press "Update"
    Then I should see "Album edited"

  Scenario: Adminuser can edit photo content with photo
    Given I am authenticated adminuser
    When I follow new photo on the new media content page
    And I fill in "Title" with "Photo new"
    And I attach the file "features/upload_files/image1.png" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "Create media content"
    Then I should have one photo
    When I follow photo on the edit media content page for "Photo new"
    And I fill in "Title" with "Photo edited"
    And I attach the file "features/upload_files/image1.png" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "Update"
    Then I should see "Photo edited"
    And I follow "Delete"
    Then I should have zero media contents

  # Scenario: Adminuser can edit album content with photo
  #   Given I am authenticated adminuser
  #   When I follow new album on the new media content page
  #   And I fill in "Title" with "Album new"
  #   And I fill in "Description" with "Lorem ipsum"
  #   And I press "Create media content"
  #   Then I should have one album
  #   And I should see "Album new"
  #   And I follow album on the edit media content page for "Album new"
  #   And I fill in "Title" with "Album edited"
  #   And I fill in "Description" with "Lorem ipsum"
  #   And I press "Update"
  #   Then I should see "Album edited"
  #   When I delete the flickr photo on "Album edited"
  #   And I follow "Delete"
  #   Then I should have zero media contents

  Scenario: Adminuser can create and delete media content photo
    Given I am authenticated adminuser
    When I follow new photo on the new media content page
    And I fill in "Title" with "Photo new"
    And I attach the file "features/upload_files/image1.png" to "media_content_photo_file"
    And I fill in "Description" with "Lorem ipsum"
    And I press "Create media content"
    Then I should have one photo
    And I should see "Photo new"
    When I follow "Delete"
    Then I should have zero media contents
    And I should be on the media contents page
    And I should not see "Photo new"

  # @javascript
  # Scenario: Adminuser can create and delete media content album
  #   Given I am authenticated adminuser
  #   When I follow new album on the new media content page
  #   And I fill in "Title" with "Album new"
  #   And I follow "add album photo"
  #   And I click on ".add_fields"
  #   And I attach the file "features/upload_files/image1.png" to "media_content_photo_file"
  #   And I fill in "Title" with "Photo new"
  #   And I fill in "Description" with "Lorem ipsum"
  #   And I press "Create media content"
  #   Then I should have one album
  #   And I should see "Album new"
  #   When I delete the flickr photo on "Album new"
  #   And I follow "Delete"
  #   Then I should have zero media contents
  #   And I should be on the media contents page
  #   And I should not see "Album new"

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
