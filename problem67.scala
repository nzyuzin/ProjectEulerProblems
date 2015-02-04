/*
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

3 7 4 2 4 6 8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and
  'Save Link/Target As...'), a 15K text file containing a triangle with
one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible
to try every route to solve this problem, as there are 2^99 altogether! If you
could check one trillion (10^12) routes every second it would take over twenty
billion years to check them all. There is an efficient algorithm to solve it.
;o)
*/

import java.util.Scanner

import scala.collection.mutable
import scala.io.Source

object problem67 {

  def main(args: Array[String]): Unit = {
    val fileName = "problem67"
    val triangle = readTriangle(fileName)
    println(getBestSum(triangle))
  }

  def getBestSum(triangle: Seq[Array[Int]]): Int = {
    for (i <-  triangle.size - 2  to 0 by -1) {
      for (j <- 0 to i) {
        triangle(i)(j) += Math.max(triangle(i + 1)(j), triangle(i + 1)(j + 1))
      }
    }
    triangle(0)(0)
  }

  def readTriangle(fileName: String): Seq[Array[Int]] = {
    val triangleArray = new mutable.MutableList[Array[Int]]
    val file = Source.fromFile(fileName)
    val scanner = new Scanner(file.bufferedReader())
    while (scanner.hasNextLine) {
      val line = scanner.nextLine()
      triangleArray += line.split(" ").map(s => s.toInt)
    }
    triangleArray
  }

}
