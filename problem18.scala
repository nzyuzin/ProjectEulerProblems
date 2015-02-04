import java.util.Scanner

import scala.collection.mutable
import scala.io.Source

object problem18 {

  class Node(valu: Int, leftNode: Node, rightNode: Node) {
    def value = valu
    def left = leftNode
    def right = rightNode
  }

  def main(args: Array[String]): Unit = {
    val triangle = readTriangle("problem18")
    println(chooseMaxPath(triangle))
  }

  def chooseMaxPath(triangle: Node): Int = {
    if (triangle.left == null || triangle.right == null) {
      triangle.value
    } else {
      val leftPath = chooseMaxPath(triangle.left)
      val rightPath = chooseMaxPath(triangle.right)
      triangle.value + Math.max(leftPath, rightPath)
    }
  }

  def readTriangle(fileName: String): Node = {
    val triangleArray = new mutable.MutableList[mutable.MutableList[Int]]
    val file = Source.fromFile(fileName)
    val scanner = new Scanner(file.bufferedReader())
    while (scanner.hasNextLine) {
      val line = scanner.nextLine()
      val numbersStringArray = line.split(" ")
      val numberArray = new mutable.MutableList[Int]
      numbersStringArray.foreach(numberString => numberArray += numberString.toInt)
      triangleArray += numberArray
    }
    def createNode(positionX: Int, positionY: Int): Node = {
      val value = triangleArray(positionY)(positionX)
      if (positionY >= triangleArray.size - 1) {
        new Node(value, null, null)
      } else {
        new Node(value, createNode(positionX, positionY + 1), createNode(positionX + 1, positionY + 1))
      }
    }
    createNode(0, 0)
  }

}
