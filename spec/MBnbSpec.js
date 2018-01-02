describe("MBnb", function() {
  var bnb;

  beforeEach(function(){
    bnb = new MBnb();
});


  it("should initialize with a list", function() {
    expect(bnb.list).toEqual(jasmine.any(Array));
  });

  it("should be able to be added to", function() {
    bnb.addToList("hello");
    expect(bnb.list.length).toEqual(1);
  });

  it("should get the list of spaces", function(){
    bnb.addToList("hello");
    expect(bnb.getList()).toBe(bnb.list);
  });

});
