function MBnb() {
  this.list = [];
};

MBnb.prototype.addToList = function (space){
  this.list.push(space);
};

MBnb.prototype.getList = function () {
  return this.list;
};
