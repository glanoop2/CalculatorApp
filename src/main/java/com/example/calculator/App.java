package com.example.calculator;

public class App {
    public static void main(String[] args) {
        Calculator calc = new Calculator();
        int a = 6, b = 3;
        System.out.println("a = " + a + ", b = " + b);
        System.out.println("add: " + calc.add(a, b));
        System.out.println("subtract: " + calc.subtract(a, b));
        System.out.println("multiply: " + calc.multiply(a, b));
        System.out.println("divide: " + calc.divide(a, b));
    }
}
