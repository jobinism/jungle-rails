describe('Render home', () => {
  beforeEach(() => {
  
    cy.visit('/')

  });
  it("Should find zero items in the shopping cart", () => {
    cy.get(".nav-item").get(".nav-link").contains("My Cart (0)");
  });
  it ("Should add an item to the shopping cart", () => {
    cy.get(".btn").first().click({force: true});
    cy.get(".nav-item").get(".nav-link").contains("My Cart (1)");
  });






});