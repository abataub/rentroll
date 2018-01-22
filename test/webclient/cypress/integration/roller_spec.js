"use strict";

const pageLoadTime = 2000;
const loginWaitTime = 2000;
const waitTime = 2000;

let receiptResponse;

// getVisibleColumnName

describe('AIR Receipt UI Tests', function () {

    /**********************************
     * Assert the title of application
     * 1. Visit Receipt application
     * 2. Assert the title 'AIR Receipts'
     ************************************/

    it('Assert the title of application', function () {
        cy.visit('http://localhost:8270/rhome/').wait(pageLoadTime);

        cy.title().should('include', 'AIR Receipts');

    });

    /************************************
     * Login into application
     * 1. Fill username and password
     * 2. Click Login button
     * ***********************************/

    it('Login into AIR Receipts', function () {

        // read config.json file to get user, pass to get logged in
        cy.readFile("./../../tmp/rentroll/config.json").then((config) => {
            // bundle user, pass and return it
            return {"user": config.Tester1Name, "pass": config.Tester1Pass};
        }).then((creds) => {

            // enter username
            cy.get('input[name=user]')
                .type(creds.user)
                .should('have.value', creds.user);

            // enter password
            cy.get('input[name=pass]')
                .type(creds.pass)
                .should('have.value', creds.pass);

            // click on login and wait for 1s to get the dashboard page
            cy.get('button[name=login]').click().wait(1000);
        });
    });


    // Temporary commented tests
    /*it('Test for receipts node', function () {

        // get API Response
        cy.server();

        cy.route('POST', '/v1/receipts/1').as('getReceipts');

        cy.wait('@getReceipts').its('status').should('eq', 200);

        cy.get('@getReceipts').then(function (xhr) {
            // receiptResponse = xhr.responseBody;

            cy.log(xhr.responseBody);

            expect(xhr.responseBody).to.have.property('status', 'success');
        });


        // It should be visible and selected
        cy.get("#node_receipts").scrollIntoView()
            .should('be.visible')
            .should('have.class', 'w2ui-selected');

    });*/


    // Temporary commented tests
    /*    it('Test for grid records', function () {

            // Check visibility of receiptsGrid
            cy.get('#grid_receiptsGrid_records').should('be.visible');

            // get length from the window and perform tests
            cy.window().then(win => {
                var gridRecsLength = win.w2ui.receiptsGrid.records.length;
                cy.log("receiptsGrid records length: ", gridRecsLength);

                // Match grid record length with total rows in receiptsGrid
                cy.get('#grid_receiptsGrid_records table tr[recid]').should(($trs) => {
                    expect($trs).to.have.length(gridRecsLength);
                });
            });
        });*/


    it('Test for the Add New Button', function () {
        let formSelector = 'div[name=receiptForm]';

        cy.contains('Add New').click().wait(waitTime);

        // Check visibility of form
        cy.get(formSelector).should('be.visible');

        // Get form
        /*cy.get(formSelector).within(() => {
            // Get all input of the forms
            cy.get('input').then(($input) => {
                // Perform visibility test on input fields only if its type is not hidden
                if(!$input.find('input').hidden){
                    return 'input';
                }
            }).then((selector) => {
                cy.log(selector);
                // Perform visibility test on input fields
                cy.get(selector).should('be.visible');
            });
        });*/

        /*        // get fields from opened w2ui form
                var formFields = w2ui[form].fields;

                // add isHidden key with default value true
                formFields.forEach(function (formField) {
                    formField.isHidden = true;
                });

                return formFields;*/

        let getW2UIFormRecords;
        let getW2UIFormFields;
        cy.window().then((win) => {
            getW2UIFormRecords = win.w2ui.receiptForm.record;
            getW2UIFormFields = win.w2ui.receiptForm.fields;
            cy.log(getW2UIFormRecords);
            cy.log(getW2UIFormFields);
        });


        let defaultValue;
        let fieldID;
        cy.get(formSelector)
            .find('input.w2ui-input:not(:hidden)')
            .each(($el, index, $list) => {

            defaultValue = getW2UIFormRecords[$el.context.id];
            fieldID = $el.context.id;

            cy.log(defaultValue);

            if(fieldID !== "BUD" && fieldID !== "PmtTypeName" && fieldID !== "Amount"){
                cy.get('#' + fieldID).should('be.visible').should('have.value', defaultValue);
            }
    });


        // {key: 'PmtTypeName', defaultValue: '-- Select Payment Type --'},
        /*var inputFields = [{key: 'DocNo', defaultValue: ''}, {key: 'Amount', defaultValue: '$0.00'}, {key: 'OtherPayorName', defaultValue: ''}, {key: 'Comment', defaultValue: ''} ];
        inputFields.forEach(function (inputField) {
            cy.get('#' + inputField.key).should('be.visible').and('have.value', inputField.defaultValue);
        });*/

        // TODO(Akshay): Business Unit value will be handled dynamically.
        // Check Business Unit field must be disabled and have value REX
        cy.get('#BUD').should('be.disabled').and('have.value', 'REX').and('be.visible');

        // TODO(Akshay): List of buttons will be handled globally if needed
        // List of visible and not visible buttons
        var visibleButtons = ["save", "saveprint"];
        var notVisibleButtons = ["reverse", "close"];

        // Check visibility of buttons
        visibleButtons.forEach(function (button) {
            // Check visibility of button
            cy.get('button[name=' + button + ']').should('be.visible');
        });

        // Check buttons aren't visible
        notVisibleButtons.forEach(function (button) {
            // Check button aren't visible
            cy.get('button[name=' + button + ']').should('not.be.visible');
        });

        // Close the form
        cy.get('[class="fa fa-times"]').click().wait(waitTime);

        // Check form should not visible after closing it
        cy.get(formSelector).should('not.be.visible');
        

    });

});