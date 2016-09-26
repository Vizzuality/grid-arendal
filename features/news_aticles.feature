Feature: NewsArticles
In order to manage news_articles
As an adminuser
I want to edit, create, view news_articles

  Scenario: User can view news_articles page
    Given I am authenticated adminuser
    And news_article
    When I go to the news_articles page
    Then I should see "About the Company"

  Scenario: Adminuser can edit news_article
    Given news_article
    And I am authenticated adminuser
    When I go to the edit news_article page for "About the Company"
    And I fill in "Title" with "About section edited"
    And I press "Update"
    Then I should see "About section edited"

  Scenario: Adminuser can create news_article
    Given I am authenticated adminuser
    When I go to the new news_article page
    And I fill in "Title" with "My new about section"
    And I fill in "Exposure slug" with "my-slug"
    And I select datetime "2016 January 23" as the "news_article_publication_date"
    And I press "Create News Article"
    Then I should have one news_article
    And I should see "My new about section"

  Scenario: Adminuser can not create news_article without title
    Given I am authenticated adminuser
    When I go to the new news_article page
    And I fill in "Title" with ""
    And I fill in "Exposure slug" with "my-slug"
    And I press "Create News Article"
    Then I should have zero news_articles
    And I should see "can't be blank"
