package example

import cats.implicits._

object StringCalculator {

  def add(numbers: String) = {
    var delimiter: Option[Char] = None
     if(numbers.contains(',')) {
       delimiter = Some(',')
    } else if(numbers.contains('\n')) {
      delimiter = Some('\n')
    }

    delimiter match {
      case Some(x) => {
        numbers
          .split(x)
          .toList
          .traverse(x => {
            try {
              Right(x.toInt)
            } catch {
              case e: NumberFormatException => Left(0)
            }
          })
          .map(xs => {
            xs.foldLeft(0)(_ + _)
          })
      }

      case None => {
        if (numbers == "") {
          Right(0)
        } else {
          Right(numbers.toInt)
        }
      }
    }
  }
}
