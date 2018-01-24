package example

import cats.implicits._

object StringCalculator {

  def add(input: String) = {
    var delimiter: Option[Char] = None
    var numbers: String = input
    val pattern = "//(.{1})".r

    val delimiterStr:Option[String] = (pattern findFirstIn input)
    delimiterStr match {
      case Some(x) => {
        numbers = input.slice(3, input.length)
        delimiter = delimiterStr
          .map(xs => {
            xs.last
          })
      }

      case None => {
        if(numbers.contains(',')) {
          delimiter = Some(',')
        } else if(numbers.contains('\n')) {
          delimiter = Some('\n')
        }
      }
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
