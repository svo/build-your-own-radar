// var basePage = require('../pageObjects/base_page')
var radarPage = require('../pageObjects/radar_page')
// var config = require('../../../cypress.json')

// Cypress.on('uncaught:exception', (err, runnable) => {
//   if (err) {
//     console.log(err.stack)
//   }
//   return false
// })

describe('Build your radar', function () {
  it('validate 1st sheet', function () {
    cy.visit(Cypress.env('host'))
    radarPage.clickTheBlipFromInteractiveSection()
    radarPage.clickTheBlip()
    radarPage.validateBlipDescription('test')
  })
})

describe('Validate search', function () {
  it('validate search', function () {
    cy.visit(Cypress.env('host'))
    radarPage.searchTheBlip()
    radarPage.validateBlipSearch()
  })
})
