package example

// import java.lang.NumberFormatException
// import cats.Semigroup
import cats.implicits._

object StringCalculator {
  def sumList(numList: List[String]): Int = {
    numList
      .map {x => x.toInt }
      .foldLeft(0)(_ + _)
  }

  def add(numbers: String) = {
    if (numbers == "") {
      Right(0)
    } else if(numbers.contains(',')) {
      val numList = numbers.split(',').toList
      val l2 = numList.traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case _: NumberFormatException => Left(0)
          }
        })
        .fold(x => x, x => x)
      l2 match {
        case Left(x) => Left(0)
        case Right(xs:List[Int]) => {
          Right(xs.foldLeft(0)(_ + _))
        }
      }
    } else if(numbers.contains('\n')) {
      val numList = numbers.split('\n').toList
      val l2 = numList
        .traverse(x => {
          try {
              Right(x.toInt)
          } catch {
            case e: NumberFormatException => Left(0)
          }
        })
      l2 match {
        case Left(x:Int) => Left(0)
        case Right(xs: List[Int]) => {
          println(xs.foldLeft(0)(_ + _))
          Right(xs.foldLeft(0)(_ + _))
        }
      }
    } else {
      Right(numbers.toInt)
    }
  }
}
