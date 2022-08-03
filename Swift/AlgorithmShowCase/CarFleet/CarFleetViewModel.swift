//
//  CarFleetViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 16/06/22.
//

import Foundation
struct Car {
	var position: Int
	var speed: Int
	var arrivalTime:Int
}
class CarFleetViewModel: ObservableObject {
	var cars:[Car] = []
	var positions:[Int] = [0,2,4]//[10,8,0,5,3]
	var speeds:[Int] = [4,2,1]// [2,4,1,1,3]
	let target: Int = 100//12
	
	init() {
		let cars = zip(self.positions, self.speeds)
							.map({Car(position:$0,
									  speed: $1,
									  arrivalTime: (self.target - $0) / $1)})
		self.cars = cars
	}
	
	func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
		var fleets: [Car] = []
		let cars = zip(self.positions, self.speeds)
							.map({Car(position:$0,
									  speed: $1,
									  arrivalTime: (self.target - $0) / $1)})
							.sorted(by: {$0.position > $1.position})
		
		for car in cars {
			if fleets.count == 0 {
				fleets.append(car)
				continue
			}
			// Reasoning behind is that:
			// A car that started behind and finishes before
			// is a car that will downgrade its velocity to match the one upfront
			guard let lastCar = fleets.last else {continue}
			if car.arrivalTime > lastCar.arrivalTime {
				fleets.append(car)
			}
		}
		return fleets.count
	}
	
	func calculateCarFleets() -> Int {
		carFleet(self.target, self.positions, self.speeds)
	}
	
}
