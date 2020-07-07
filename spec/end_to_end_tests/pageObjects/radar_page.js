class RadarPage {
  constructor () {
    this.blip = '.quadrant-group-second .blip-link'
    this.blip_selected = '.quadrant-table.selected .blip-list-item'
    this.blip_description = '.blip-item-description.expanded p'
    this.autocomplete = '.search-radar'
    this.search_value = 'Babel'
    this.search_item = '.ui-menu-item:first'
  }

  clickTheBlipFromInteractiveSection () {
    cy.get(this.blip).click()
  }

  clickTheBlip () {
    cy.get(this.blip_selected).click()
  }

  validateBlipDescription (text) {
    expect(cy.get(this.blip_description).contains(text))
  }

  searchTheBlip () {
    cy.get(this.autocomplete).type(this.search_value)
    cy.get(this.search_item).click()
  }

  validateBlipSearch () {
    expect(cy.get(this.blip_selected).contains(this.search_value))
  }
}

module.exports = new RadarPage()
