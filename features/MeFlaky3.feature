Feature: Flaky test number three

  Scenario: Do it (with 70% of maybe)
    Given I have a flaky test
    When I run it
    Then There is "30%" chance of it failing