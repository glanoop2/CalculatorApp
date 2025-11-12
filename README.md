# calculator-app

Simple Java Maven project with JUnit 5 tests.

## Prerequisites
- JDK 17+
- Apache Maven 3.9+

## Build & Test
```bash
mvn -v
mvn clean verify
```

## Run
```bash
mvn -q exec:java
```

## Project layout
```text
calculator-app/
  ├── pom.xml
  └── src
      ├── main/java/com/example/calculator
      │   ├── App.java
      │   └── Calculator.java
      └── test/java/com/example/calculator
          └── CalculatorTest.java
```
