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
    And I press "SAVE"
    Then I should see "About section edited"

