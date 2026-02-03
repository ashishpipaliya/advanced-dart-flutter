abstract class Shape {
  double area();
}

class Circle implements Shape {
  final double r;
  Circle(this.r);
  @override
  double area() => 3.14159 * r * r;
}

class Rectangle implements Shape {
  final double w, h;
  Rectangle(this.w, this.h);
  @override
  double area() => w * h;
}

void printArea(Shape s) {
  print('Area: ${s.area()}');
}

void main() {
  print('=== Polymorphism ===');
  final Shape c = Circle(2);
  final Shape r = Rectangle(3, 4);
  printArea(c);
  printArea(r);
}