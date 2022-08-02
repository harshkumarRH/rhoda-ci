*** Settings ***
Documentation       Provision and Deploy Crunchy Bridge Database Instance from Developer View
Metadata            Version    0.0.1

Library             SeleniumLibrary
Resource            ../resources/keywords/provision_dbinstance.resource

Suite Setup         Set Library Search Order    SeleniumLibrary
Suite Teardown      Tear Down The Test Suite
Test Setup          Given The Browser Is On Openshift Home Screen
Test Teardown       Tear Down The Test Case


*** Test Cases ***
Scenario: Provision CockroachDB Database Instance for Invalid Provider Account from Developers View
    [Tags]    smoke    RHOD-57-dev    inv
    When User Imports Invalid Cockroach Provider Account
    And User Navigates To Create Database Instance Screen On Developer View
    Then DBSC Instance Retrieval Failed On Dev View

Scenario: Provision CockroachDB Database Instance from Developers View
    [Tags]    smoke    RHOD-58-dev
    When User Imports Valid Cockroach Provider Account
    And User Navigates To Create Database Instance Screen On Developer View
    And User Enters Data To Create Instance On Dev View
    Then Cockroach DBSC Instance Provisioned And Deployed On Developer Topology Graph View
