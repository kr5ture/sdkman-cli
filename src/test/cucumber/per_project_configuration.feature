Feature: Per-project configuration

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Env without providing an .sdkmanrc file
    Given the system is bootstrapped
    When I enter "sdk env"
    Then I see ".sdkmanrc not found."
    And the exit code is 1

  Scenario: Use the candidate versions provided by .sdkmanrc
    Given the file ".sdkmanrc" exists and contains
      """
      groovy=2.4.1
      """
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the candidate "groovy" version "2.4.1" is a valid candidate version
    And the candidate "groovy" version "2.4.1" is already installed but not default
    And the system is bootstrapped
    When I enter "sdk env"
    Then the candidate "groovy" version "2.4.1" should be in use