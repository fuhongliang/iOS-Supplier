//
//  LocationHelper.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//
import Foundation

class LocationHelper {

    private init() {}

    public static let shared: LocationHelper = LocationHelper()

    public var location: LocationInfo?

    public func saveLocationToCache() {
        guard location != nil else {
            return
        }
        do {
            let data = try JSONEncoder().encode(location!)
            UserDefaults.standard.set(data, forKey: "MYiMei_Location")
        }
        catch {
            // do nothing
            print("Error")
        }
    }

    public func loadLocationFromCache() {
        if let data = UserDefaults.standard.object(forKey: "MYiMei_Location") as? Data {
            do {
                location = try JSONDecoder().decode(LocationInfo.self, from: data)
            }
            catch {
                print("Error")
            }
        }
    }

    public func cleanUser() {
        location = nil
        UserDefaults.standard.set("", forKey: "MYiMei_Location")
    }

}
