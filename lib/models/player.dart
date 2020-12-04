class Player {
  String name;
  int rating;
  bool present;

  Player(this.name, this.rating, {this.present = false});

  @override
  String toString() {
    return '{ ${this.name}, ${this.rating}, ${this.present} }';
  }
}
