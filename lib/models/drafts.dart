class Drafts {
  int type;
  int rating;

  Drafts(this.type, this.rating);

  @override
  String toString() {
    return '{ ${this.type}, ${this.rating} }';
  }
}
