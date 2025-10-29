//: [Previous](@previous)

import Foundation
struct Task: Equatable, Comparable {
	
	var quantity:Int
	var id:Character
	
	init(_ id: Character, _ quantity:Int = 0) {
		self.id  = id
		self.quantity = quantity
	}
	
	mutating func addTask(){
		self.quantity += 1
	}
	
	mutating func removeTask(){
		guard self.quantity > 0 else {return}
		self.quantity -= 1
	}
	
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.id == rhs.id
	}
	
	static func > (lhs: Self, rhs: Self) -> Bool {
		lhs.quantity > rhs.quantity
	}
	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.quantity < rhs.quantity
	}
}

struct Tasks {
	var register:[Character: Task] = [:]
	init(_ tasks: [Character]) {
		for key in tasks {
			if register[key] == nil {
				let task =  Task(key, 1)
				register[key] = task
			} else {
				register[key]!.addTask()
			}
		}
	}
	
	func getTaskArray()->[Task]{
		var output:[Task] = []
		for task in self.register.values {
			output.append(task)
		}
		return output
	}
}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
	var cpu: [Character] = []
	var processingQueue: [(task:Task, time: Int)] = []
	let tasks = Tasks(tasks)
	let taskArray = tasks.getTaskArray()
	var maxHeap = Heap(elements: taskArray, priorityFunction: >)
	var t = 1
	
	while true {
		if maxHeap.isEmpty && processingQueue.isEmpty {
			break
		}
		
		if var task = maxHeap.dequeue() {
			task.removeTask()
			let time = 1 + t + n
			if task.quantity > 0 {
				processingQueue.append((task, time))
			}
			cpu.append(task.id)
		} else {
			cpu.append("-")
		}
			
		t += 1
		
		if var nextTime = processingQueue.first?.time {
			while t == nextTime {
				let waitingTask = processingQueue.removeFirst().task
				if waitingTask.quantity > 0 {
					maxHeap.enqueue(waitingTask)
				}
				nextTime = processingQueue.first?.time ?? 0
			}
		}
	}
	return cpu.count
}

leastInterval(["A","A","A","B","B","B"], 2)

//: [Next](@next)
