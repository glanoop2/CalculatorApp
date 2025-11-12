package com.example.calculator;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    @Test
    @DisplayName("divide throws on zero")
    void divideByZero() {
        Calculator calc = new Calculator();
        assertThrows(IllegalArgumentException.class, () -> calc.divide(1, 0));
    }

    @ParameterizedTest(name = "{0} + {1} = {2}")
    @CsvSource({
            "1, 2, 3",
            "-1, 1, 0",
            "20, 22, 42",
            "0, 0, 0"
    })
    void addParameterized(int a, int b, int expected) {
        Calculator calc = new Calculator();
        assertEquals(expected, calc.add(a, b));
    }

    @Test
    void multiply() {
        Calculator calc = new Calculator();
        assertAll(
            () -> assertEquals(6, calc.multiply(2,3)),
            () -> assertEquals(0, calc.multiply(0,5)),
            () -> assertEquals(-15, calc.multiply(-3,5))
        );
    }
}
