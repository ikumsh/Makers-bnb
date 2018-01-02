describe("MBnb", function() {
  var bnb;
  var property;

  beforeEach(function(){
    bnb = new MBnb();
    property = new Space(123,"title","desc","address","price");
});


  it("should initialize with a list", function() {
    expect(bnb.list).toEqual(jasmine.any(Array));
  });

  it("should be able to be added to", function() {
    bnb.addToList(property);
    expect(bnb.list).toContain(jasmine.objectContaining(property));
  });

  it("should get the list of spaces", function(){
    bnb.addToList("hello");
    expect(bnb.getList()).toBe(bnb.list);
  });


});
