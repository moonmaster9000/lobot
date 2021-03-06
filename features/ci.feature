Feature: CI

  Background:
    Given the temp directory is clean
    And I am in the temp directory

  Scenario: Installing Lobot on a rails3 project
    When I create a new Rails project
    And I vendor Lobot
    And I put Lobot in the Gemfile
    And I run bundle install
    And I run the Lobot generator for "Jenkins"
    Then rake reports ci tasks as being available

  @aws
  Scenario: Install Jenkins CI on Amazon AWS using new Rails template
    When I create a new Rails project
    And I vendor Lobot
    And I put Lobot in the Gemfile
    And I add a gem with an https://github.com source
    And I run bundle install
    And I run the Lobot generator for "Jenkins"
    And I enter my info into the ci.yml file
    And I make changes to be committed
    And I push to git
    And I start the server
    And I bootstrap
    And I deploy
    Then CI is green
