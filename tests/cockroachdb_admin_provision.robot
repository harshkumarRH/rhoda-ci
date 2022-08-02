*** Settings ***
Documentation       Provision and Deploy Crunchy Bridge Database Instance from Administrator View
Metadata            Version    0.0.1

Library             SeleniumLibrary
Resource            ../resources/keywords/provision_dbinstance.resource

Suite Setup         Set Library Search Order    SeleniumLibrary
Suite Teardown      Tear Down The Test Suite
Test Setup          Given The Browser Is On Openshift Home Screen
Test Teardown       Tear Down The Test Case


*** Test Cases ***
Scenario: Provision CockroachDB Database Instance for Invalid Provider Account from Administrator View
    [Tags]    smoke    RHOD-57-1   inv
    When User Imports Invalid Cockroach Provider Account
    And User Navigates To Create Database Instance Screen From Database Access Page
    And User Selects DBProvider And Provider Account
    Then DBSC Instance Retrieval Failed On Admin View

Scenario: Provision CockroachDB Database Instance from Administrator View
    [Tags]    smoke    RHOD-57
    When User Imports Valid Cockroach Provider Account
    And User Navigates To Create Database Instance Screen From Database Access Page
    And User Enters Data To Create Database Instance On Admin View
    Then Cockroach DBSC Instance Provisioned And Deployed On Developer Topology Graph View
