package example

import java.lang.NumberFormatException
import cats.syntax.traverse._

object StringCalculator {
  def sumList(numList: List[String]): Int = {
    numList
      .map {x => x.toInt }
      .foldLeft(0)(_ + _)
  }

  def add(numbers: String):Either[Int, Int] = {
    if (numbers == "") {
      Right(0)
    } else if(numbers.contains(',')) {
      val numList = numbers.split(',')
      numList
        .traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case e: NumberFormatException => Left(0)
          }
        })
        .foldLeft(0)(_ + _)
    } else if(numbers.contains('\n')) {
      val numList = numbers.split('\n')
      numList
        .traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case e: NumberFormatException => Left(0)
          }
        })
        .foldLeft(0)(_ + _)
    } else {
      Right(numbers.toInt)
    }
  }
}
