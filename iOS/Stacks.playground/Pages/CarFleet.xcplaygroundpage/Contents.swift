//: [Previous](@previous)

import Foundation

class Car {
	var position:Int
	var velocity: Int
	var target:Int
	var travelTime:Double

	init(position:Int, velocity: Int, target:Int){
		self.position = position
		self.velocity = velocity
		self.target = target
		self.travelTime = ((Double(target) - Double(position)) / Double(velocity))
		//print(Double((target - position) / velocity))
	}
}

func carFleet(_ target: Int,
			  _ position: [Int],
			  _ speed: [Int]) -> Int {

	var fleets:[Car] = []
	var cars = zip(position, speed).map({Car(position: $0, velocity: $1, target: target)})
	cars = cars.sorted(by: {$0.position > $1.position})
	cars.forEach({print("pos:\($0.position), speed:\($0.velocity),travelTime:\($0.travelTime)")})
	
	for car in cars {
		if fleets.count == 0{
			fleets.append(car)
			continue
		}
		if let lastCar = fleets.last {
			if car.travelTime > lastCar.travelTime {
				fleets.append(car)
			}
		}
	}
	
	return fleets.count
}

//let target = 12
//let position = [10,8,0,5,3]
//let speed = [2,4,1,1,3]
let target = 10
let position = [6,8]
let speed = [3,2]
let fleets = carFleet(target, position, speed)

//var car1 = Car(position: 0, velocity: 1)
//var car2 = Car(position: 0, velocity: 2)
//var cars = [car1, car2]
//cars[0].velocity = 10
