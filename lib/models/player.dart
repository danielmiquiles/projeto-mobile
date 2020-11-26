class Player {
  String name;
  int rating;

  Player(this.name, this.rating);

  @override
  String toString() {
    return '{ ${this.name}, ${this.rating} }';
  }
}
