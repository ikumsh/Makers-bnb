describe("Space", function() {
  var space;

  beforeEach(function() {
    space = new Space(123,"title","desc","address","price");
  });

  it("should initialize properly", function() {
    expect(space._title).toEqual("title");
  });
});
