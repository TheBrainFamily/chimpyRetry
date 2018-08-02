Feature: Show something always working for a change

  Scenario:  Do it!
    Given I have a non-flaky test
    When I run it
    Then There is "0%" chance of it failing