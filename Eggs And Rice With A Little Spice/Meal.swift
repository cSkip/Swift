//
//  Meal.swift
//  Eggs And Rice With A Little Spice
//
//  Created by Connor Skipton on 11/27/16.
//  Copyright © 2016 Connor Skipton. All rights reserved.
//

import UIKit

class  Meal: NSObject{
    

    static let DocumentsDirectory =
        FileManager().urls(for: .documentDirectory, in:
            .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
      // MARK: Types
    
    struct PropertyKey{
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder){
        aCoder.encode(name,forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
     
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
        
        
    }

}
