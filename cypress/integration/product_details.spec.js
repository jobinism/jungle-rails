//test to make sure we are shown the product details page

describe('Render homepage', () => {
  beforeEach(() => {
  
    cy.visit('/')

  });
  it("Should bring us to product details info", () => {
    cy.get(".products article").first().find("img").click();
    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.").should("exist");
  });




});