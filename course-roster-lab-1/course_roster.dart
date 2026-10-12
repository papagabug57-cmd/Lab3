// Part 1 — Setup & Welcome (5 min) 

void main() {
    printWelcome('Course Router Manager');
  
}

void printWelcome(String appname) {
  print('=== $appname ===');
}

// Part 2 — Course & Roster Data (15 min) 

void main() {
  printWelcome('Course Roster Manager');

  const int maxCapacity = 4;    // 4 is known before the program run so it is const.
  final DateTime createdAt = DateTime.now(); // time is not known until the program run so it is not const.
  String courseTitle = 'CS201: Mobile App Development';
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;

  List<String> enrolledStudents = [   // A list can contain multiple students and keeps their order.
    'Aiden',
    'Maria',
    'Jamal',
  ];

  Set<String> waitlist = { // A set stores unique values.
    'Priya',
    'Noah',
  };

  Map<String, int> attendanceCount = { // The student name is the key and their attendance count is the value.
    'Aiden': 3,
    'Maria': 4,
    'Jamal': 2,
  };

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );
}

void printWelcome(String appName) {
  print('=== $appName ===');
}

// Part 3 — Null-Safe Instructor Info (10 min) 

void main() {
  printWelcome('Course Roster Manager');


  const int maxCapacity = 4;   // 4 is known before the program run so it is const.
  final DateTime createdAt = DateTime.now(); // time is not known until the program run so it is not const.
  String courseTitle = 'CS201: Mobile App Development'; 
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;

  List<String> enrolledStudents = [  // A list can contain multiple students and keeps their order.
    'Aiden',
    'Maria',
    'Jamal',
  ];

  Set<String> waitlist = { // A set stores unique values.
    'Priya',
    'Noah',
  };

  Map<String, int> attendanceCount = { // The student name is the key and their attendance count is the value.
    'Aiden': 3,
    'Maria': 4,
    'Jamal': 2,
  };

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );


  String? instructorEmail;
  print(instructorEmail ?? 'TBA');

  late String enrollmentCode;
  enrollmentCode = generateCode(courseTitle);
  print('Enrollment code: $enrollmentCode');
  print('Instructor email length: ${instructorEmail?.length ?? 0}');
}
void printWelcome(String appName) {
  print('=== $appName ===');
}

String generateCode(String title) {
  return title.substring(0, 2).toUpperCase() + '101';
}

// Part 4 — Formatting Strings (10 min) 

String rawNames = ' Aiden , maria ,JAMAL , Priya ';
List<String> cleanNames = [];

for (String name in rawNames.split(',')) {
  cleanNames.add(name.trim());
}

print('Clean names: $cleanNames');

String courseDescription = '''
Course: $courseTitle
Credits: $creditHours
Capacity: $capacity students
''';

print(courseDescription);

print('Seats left: ${capacity - enrolledStudents.length}');



// Part 5 — Operators in Action (10 min) 

int fullGroups = enrolledStudents.length ~/ 3;
int leftover = enrolledStudents.length % 3;
print('Full groups of 3: $fullGroups, leftover: $leftover');
Object formInput = 'twenty-two';

if (formInput is String) {
  print('This is text!');
}

if (formInput is! int) {
  print('The form input is not an integer.');
}
StringBuffer report = StringBuffer()
  ..write('Report: $courseTitle')
  ..write(' | Cap: $capacity')
  ..write(' | Roster: ${enrolledStudents.length}');

print(report.toString());
List<String>? extraNotes;

extraNotes?..add('Room change pending');

print('Extra notes: $extraNotes');
int? bonusSeats;
bonusSeats ??= 0;
print('Bonus seats: $bonusSeats');


// Part 6 — Enrollment Logic (10 min) 

if (isOpen && enrolledStudents.length < capacity) {
  print("You're in! Welcome aboard.");
} else {
  print('Sorry, the course is currently full.');
}
int enrollmentStatusCode = 200;

switch (enrollmentStatusCode) {
  case 200:
    print('Enrolled');
    break;

  case 404:
    print('Course not found');
    break;

  default:
    print('Unknown error');
    break;
}
String statusTag = isOpen ? 'OPEN' : 'FULL';

print(statusTag);

// Part 7 — Reports & Loops (10 min) 

void main() {
  printWelcome('Course Roster Manager');

  const int maxCapacity = 4; // 4 is known before the program run so it is const.
  final DateTime createdAt = DateTime.now();  // time is not known until the program run so it is not const.
  String courseTitle = 'CS201: Mobile App Development';
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;
  List<String> enrolledStudents = [  // A list can contain multiple students and keeps their order.
    'Aiden',
    'Maria',
    'Jamal',
  ];
  Set<String> waitlist = {  // A set stores unique values.
    'Priya',
    'Noah',
  };
  Map<String, int> attendanceCount = {  // The student name is the key and their attendance count is the value.
    'Aiden': 3,
    'Maria': 4,
    'Jamal': 2,
  };

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );
  String? instructorEmail;
  print(instructorEmail ?? 'TBA');
  late String enrollmentCode;
  enrollmentCode = generateCode(courseTitle);
  print('Enrollment code: $enrollmentCode');
  print('Instructor email length: ${instructorEmail?.length ?? 0}');
  String rawNames = ' Aiden , maria ,JAMAL , Priya ';
  List<String> cleanNames = [];

  for (var name in rawNames.split(',')) {
    cleanNames.add(name.trim());
  }
  print('Clean names: $cleanNames');
  String courseDescription = '''
  Course: $courseTitle
   Credits: $creditHours
  Capacity: $capacity students
   ''';

  print(courseDescription);
  print('Seats left: ${capacity - enrolledStudents.length}');
  
  int fullGroups = enrolledStudents.length ~/ 3;
  int leftover = enrolledStudents.length % 3;
  print('Full groups of 3: $fullGroups, leftover: $leftover');
  Object formInput = 'twenty-two';

  if (formInput is String) {
    print('This is text!');
  }
  if (formInput is! int) {
    print('The form input is not an integer.');
  }

  StringBuffer report = StringBuffer()
    ..write('Report: $courseTitle')
    ..write(' | Cap: $capacity')
    ..write(' | Roster: ${enrolledStudents.length}');

  print(report.toString());
  List<String>? extraNotes;
  extraNotes?..add('Room change pending');
  print('Extra notes: $extraNotes');
  int? bonusSeats;

  bonusSeats ??= 0;
  print('Bonus seats: $bonusSeats');
  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in! Welcome aboard.");
  } else {
    print('Sorry, the course is currently full.');
  }
  int enrollmentStatusCode = 200;
  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;

    case 404:
      print('Course not found');
      break;

    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';
  print(statusTag);
  for (var student in enrolledStudents) {
    print(student);
  }
  attendanceCount.forEach((student, count) {
    print('$student: $count');
  });

  List<String> announcements = [
    'Welcome to $courseTitle',
    if (!isOpen) 'Course is FULL — waitlist open',
    for (var student in waitlist)
      'Reminder: $student, please confirm attendance',
  ];
  for (var announcement in announcements) {
    print(announcement);
  }
}
void printWelcome(String appName) {
  print('=== $appName ===');
}
String generateCode(String title) {
  return title.substring(0, 2).toUpperCase() + '101';
}