package example

import org.scalatest._

class StringCalculatorSpec extends FlatSpec with Matchers {
  behavior of "StringCalculator#add"

  it should "accept an empty string and return 0" in {
    val result = StringCalculator.add("")
    result should equal(Right(0))
  }

  it should "accept string with 1 number and return the number" in {
    val input = "3"
    val result = StringCalculator.add(input)
    result should equal(Right(3))
  }

  it should "accept string with 2 numbers and return their sum" in {
    val input = "5,4"
    val result = StringCalculator.add(input)
    result should equal(Right(9))
  }

  it should "accept a string with unlimited comma-seperated numbers and return their sum" in {
    val input = "5,4,2,4"
    val result = StringCalculator.add(input)
    result should equal(Right(15))
  }

  it should "accept a string with unlimited newline seperated numbers and return their sum" in {
    val input = "5\n4\n6"
    val result = StringCalculator.add(input)
    result should equal(Right(15))
  }

  it should "not accept a mixed delimter pattern in the input string" in {
    val input = "5\n4,6"
    val result = StringCalculator.add(input)
    result should equal(Left(0))
  }

  it should "identify custom delimiters at the beginning of the string" in {
    val input = "//;1;3;5"
    val result = StringCalculator.add(input)
    result should equal(Right(9))
  }
}
