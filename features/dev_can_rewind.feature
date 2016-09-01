Feature: As a developer, when my cuke fails, I should be able to rewind
  Scenario: Test
    Given I have a counter

    When I increment it

    Then I should see it is 1
