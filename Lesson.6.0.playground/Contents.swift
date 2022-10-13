import UIKit
import Foundation



struct Queue<Element> {
    var elements: [Element] = []
    
    mutating func enqueue(element: Element) {
        elements.insert(element, at: 0)
    }
    
    mutating func dequeue() -> Element? {
        return elements.removeLast()
    }
    
    func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var filteredElements: [Element] = []
        for element in elements {
            if isIncluded(element) {
                filteredElements.append(element)
            }
        }
        return filteredElements
    }
    
    subscript(index: Int) -> Element? {
        elements.indices.contains(index) ? elements[index] : nil
    }
}

var queue = Queue<Int>()
queue.enqueue(element: 1)
queue.enqueue(element: 2)
queue.enqueue(element: 3)

let filteredArray = queue.filter { $0 < 3 }
queue[2]
