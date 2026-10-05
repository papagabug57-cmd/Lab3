// lab3.dart - Campus Cafe Order System
// Name: Abdul Rehman Roll no: 04072312041 Semester: 8th

const String rollNo = '04072312041';

// ===== Seeded settings (generated from YOUR roll number). Do not edit. =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10; // tens digit
final int u = seed % 10; // units digit

const List<String> menu = [
  'Chai',
  'Latte',
  'Mocha',
  'Samosa',
  'Brownie',
  'Sandwich',
  'Cold Coffee',
  'Fries',
  'Pakora',
  'Zinger Wrap',
];

int priceOf(int i) => 100 + 7 * i + 3 * t;
final int priceFloor = 60 + 5 * t;
final int taxPercent = 5 + t;
final int bigOrderLimit = 450 + 20 * t;
final int balanceCap = 600 + 20 * t;
final int couponPercent = 5 + t + u;
// ===========================================================================

class Dish {
  late String name;
  late int price;
}

class MenuItem {
  String name;
  int price;
  MenuItem(this.name, this.price) {
    // Raise price to pricefloor if it low
    if (this.price < priceFloor) {
      this.price = priceFloor;
    }
  }

  // name constructor for free items
  MenuItem.free(this.name) : price = 0;

  // name constructor that creates an item from text
  MenuItem.fromString(String text)
    : name = text.split(':')[0],
      price = int.parse(text.split(':')[1]);

  // Step 8: Nice string representation
  @override
  String toString() => '$name (Rs $price)';
}

class OrderLog {
  static OrderLog? _instance;

  final List<String> entries = [];

  // Private name constructor
  OrderLog._internal();

  // factory  constructor returns the same object
  factory OrderLog() {
    return _instance ??= OrderLog._internal();
  }

  void add(String msg) => entries.add(msg);
}

class OrderLine {
  final MenuItem item;
  final int qty;
  final int total;
  final int tax;

  OrderLine(this.item, this.qty)
    : total = item.price * qty,
      tax = item.price * qty * taxPercent ~/ 100,
      assert(qty > 0, 'qty must be positive');

  // Step 6: Getter for total including ta
  int get grand => total + tax;

  // Step 6: Getter for checking whether it is a big order
  bool get isBigOrder => grand > bigOrderLimit;

  // Step 6: Getter for a readable label
  String get label => '${item.name} x$qty';
}

// Main order reused in later step
OrderLine mainOrder() {
  return OrderLine(MenuItem(menu[u], priceOf(u)), 2 + (t + u) % 5);
}

class StudentCard {
  final String owner;

  // Private backing field
  int _balance;

  StudentCard(this.owner) : _balance = 0;

  int get balance => _balance;

  set balance(int v) {
    if (v < 0) {
      _balance = 0;
    } else if (v > balanceCap) {
      _balance = balanceCap;
    } else {
      _balance = v;
    }
  }
}

List<MenuItem> buildMenu() {
  return [
    for (int k = 0; k < 4; k++)
      MenuItem.fromString(
        '${menu[(u + 3 * k) % 10]}:${priceOf((u + 3 * k) % 10)}',
      ),
  ];
}

List<OrderLine> buildReceipt() {
  List<MenuItem> items = buildMenu();

  return [for (int k = 0; k < 3; k++) OrderLine(items[k], 1 + (t + k) % 4)];
}

class Coupon {
  static final Map<String, Coupon> _cache = {};

  final String code;
  final int percent;
  final int minSpend;

  Coupon(this.code, this.percent)
    : minSpend = percent * 70,
      assert(percent >= 1 && percent <= 50, 'percent must be between 1 and 50');

  factory Coupon.fromCode(String code) {
    return _cache.putIfAbsent(code, () => Coupon(code, couponPercent));
  }

  int discountOn(int amount) {
    if (amount >= minSpend) {
      return amount * percent ~/ 100;
    }

    return 0;
  }
}

void main() {
  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

void step1() {
  print('--- Step 1 ---');

  Dish item1 = Dish();
  item1.name = menu[u];
  item1.price = priceOf(u);

  Dish item2 = Dish();
  int index = (u + 1) % 10;
  item2.name = menu[index];
  item2.price = priceOf(index);

  item2.price = item2.price - u;

  print('Step 1: ${item1.name} Rs ${item1.price}');
  print('Step 1: ${item2.name} Rs ${item2.price}');
}

void step2() {
  print('--- Step 2 ---');

  MenuItem a = MenuItem(menu[u], priceOf(u));
  MenuItem b = MenuItem('Test Special', 15 * u);

  print('Step 2: ${a.name} Rs ${a.price}');
  print('Step 2: Test Special Rs ${b.price}');
}
// STEP 2 - Think:
// price cannot be final because the constructor may change it when the supplied price is below  pricefloor

void step3() {
  print('--- Step 3 ---');

  MenuItem freebie = MenuItem.free('Water');

  int i = (u + 2) % 10;
  MenuItem parsed = MenuItem.fromString('${menu[i]}:${priceOf(i)}');

  print('Step 3: ${freebie.name} Rs ${freebie.price}');
  print('Step 3: ${parsed.name} Rs ${parsed.price}');
  print('Step 3: floor=$priceFloor, free price=${freebie.price}');
}
// STEP 3 - Think:
// free() uses a different named constructor, so it directly initializes price to 0 and does not execute the main constructor floor logic

void step4() {
  print('--- Step 4 ---');

  OrderLog log1 = OrderLog();
  OrderLog log2 = OrderLog();

  for (int i = 1; i <= u + 2; i++) {
    String message = 'order #${100 * t + i}';

    if (i % 2 == 1) {
      log1.add(message);
    } else {
      log2.add(message);
    }
  }

  print('Step 4: same object? ${identical(log1, log2)}');
  print('Step 4: entries = ${log1.entries.length}');
  print('Step 4: last = ${log2.entries.last}');
}
// STEP 4 - Think:
// The underscore makes instance and internal  private to this Dart library file Without it outside code could access them

void step5() {
  print('--- Step 5 ---');

  OrderLine line = mainOrder();

  print('Step 5: ${line.item.name} x${line.qty}');
  print('Step 5: total=${line.total} tax=${line.tax}');

  try {
    OrderLine(line.item, 0);
    print('Step 5: assert did NOT fire');
  } on AssertionError {
    print('Step 5: assert fired');
  }
}
// STEP 4 - Think:
// The underscore makes instance and internal private to this Dart library file Without it outside code could access them

void step6() {
  print('--- Step 6 ---');

  OrderLine line = mainOrder();

  print('Step 6: grand=${line.grand}');
  print('Step 6: big order? ${line.isBigOrder} (limit $bigOrderLimit)');
  print('Step 6: label=${line.label}');
}
// STEP 6 - Think:
// A getter can be read like a field and can  calculate a value dynamically instead of storing that value directly

void step7() {
  print('--- Step 7 ---');

  StudentCard card = StudentCard('S$seed');

  card.balance = seed * 10 + 50;
  print('Step 7: topped up -> ${card.balance}');

  card.balance = -seed - 1;
  print('Step 7: bad value -> ${card.balance}');

  card.balance = balanceCap - u;
  print('Step 7: reset -> ${card.balance}');

  card.balance = card.balance - mainOrder().grand;
  print('Step 7: paid order -> ${card.balance}');
}
// STEP 7 - Think:
// Another option for an invalid value would be to throw an  exception instead of silently clamping it

void step8() {
  print('--- Step 8 ---');

  List<MenuItem> items = buildMenu();

  MenuItem priciest = items.reduce((a, b) => a.price > b.price ? a : b);

  int sum = items.fold(0, (total, item) => total + item.price);

  print('Step 8: menu = $items');
  print('Step 8: priciest = ${priciest.name}');
  print('Step 8: sum = $sum');
}

void step9() {
  print('--- Step 9 ---');

  List<OrderLine> receipt = buildReceipt();

  int sum = 0;

  for (OrderLine line in receipt) {
    print('Step 9: ${line.label} = ${line.grand}');

    OrderLog().add('receipt: ${line.label}');

    sum += line.grand;
  }

  print('Step 9: receipt total = $sum');
  print('Step 9: log size = ${OrderLog().entries.length}');
}

void step10() {
  print('--- Step 10 ---');

  String code = 'CAFE${seed.toString().padLeft(2, '0')}';

  Coupon c1 = Coupon.fromCode(code);
  Coupon c2 = Coupon.fromCode(code);

  List<OrderLine> receiptLines = buildReceipt();

  int receipt = receiptLines.fold(0, (sum, line) => sum + line.grand);

  int discount = c1.discountOn(receipt);

  print(
    'Step 10: $code gives ${c1.percent}% off, '
    'min spend ${c1.minSpend}',
  );

  print('Step 10: cached? ${identical(c1, c2)}');

  print(
    'Step 10: receipt $receipt, '
    'discount $discount, '
    'payable ${receipt - discount}',
  );
}

// Q1. Animal(this.name, this.type); and the verbose constructor give the same result. What does the shorthand save you?
// The shorthand saves us from writing the field assignments manually. It automatically assigns the constructor parameters to the fields.

// Q2. When would you choose a named constructor, and when a factory constructor?
// A named constructor is useful when a class has different ways of initializing an object. A factory constructor is useful when object creation needs special control, such as returning a cached object.

// Q3. What is the difference between assigning a field in a constructor body and assigning it in an initializer list?
// An initializer list runs before the constructor body and is required for initializing final fields. The constructor body runs afterward.

// Q4. Give one reason to use a getter instead of storing the value in a field, and one reason to use a setter instead of a public field.
// A getter can calculate a value when it is requested instead of storing the calculated value. A setter can validate or modify a value before storing it.
