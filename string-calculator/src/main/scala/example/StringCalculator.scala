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
      val numList = numbers.split(',').toList
      numList.traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case e: NumberFormatException => Left(0)
          }
        })
        .fold(???)
    } else if(numbers.contains('\n')) {
      val numList = numbers.split('\n').toList
      numList
        .traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case e: NumberFormatException => Left(0)
          }
        })
        .fold(???)
    } else {
      Right(numbers.toInt)
    }
  }
}
