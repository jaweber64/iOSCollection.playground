// Playground - noun: a place where people can play

// Janet Weber   DUE: 9/28/15
// Critical Thinking Exercise Week 6: collections

// Write the code to organize and extract some data from a 
// collection of items you have at home. Use at least one 
// dictionary and one array/

// I chose to theme this around the colleges my kids and nieces/nephews attended
// or currently attend.

import UIKit
// ****************************************
// VARIABLES & CONSTANTS
// *****************************************
let MAJORS = ["nursing", "music", "electrical engineering", "marketing", "graphic design", "chemistry",
    "economics", "social work", "physician assistant studies", "aviation", "business mgmt"]
let FAMILIES = ["Dawson", "Glaser", "Stutzman", "Weber"]

// These students are either my kids or my nieces/nephews who have attended or are
//  attending college.
var studentSchool: Dictionary<String, String> = ["Sarah (Stutzman) Leitz": "Valparaiso University", "Jennifer Dawson": "St. Elizabeth's School of Nursing", "Gregory Stutzman": "Valparaiso University", "Adam Stutzman": "St. Joseph's College", "Christopher Dawson": "Indiana University South Bend", "Jacob Stutzman": "University of Saint Francis", "Christian Weber": "Roosevelt University", "Joseph Weber": "Seton Hill University", "Aaron Weber": "Quincy University", "Hannah Weber": "Lewis University", "Andrew Glaser": "Holy Cross College", "Elizabeth Glaser": "St. Mary's College", "Melissa Dawson": "Ball State University"]

// Series of parallel arrays containing other obvious information
var studentName: [String] = ["Sarah (Stutzman) Leitz", "Jennifer Dawson", "Gregory Stutzman", "Adam Stutzman", "Christopher Dawson", "Jacob Stutzman", "Christian Weber", "Joseph Weber", "Aaron Weber", "Hannah Weber", "Andrew Glaser", "Elizabeth Glaser", "Melissa Dawson"]

var schoolLoc: [String] = ["Valparaiso, IN", "Lafayette, IN", "Valparaiso, IN", "Renssellaer, IN", "South Bend, IN", "Fort Wayne, IN", "Chicago, IL", "Greensburg, PA", "Quincy, IL", "Romeoville, IL", "Notre Dame, IN", "Notre Dame, IN", "Muncie, IN"]

var major: [String] = ["music", "nursing", "electrical engineering", "marketing", "graphic design", "music technology", "economics", "physician assistant studies", "aviation", "nursing", "business mgmt", "chemistry (forensic science)", "social work" ]

var gradYear: [Int] = [2009, 2009, 2010, 2013, 2015, 2017, 2013, 2017, 2017, 2018, 2017, 2019, 2017]

var i, j, currentMin, length, maxIndex : Int
var tmpInt, currentInt, nextInt : Int                   //  used for sorting (comparing and swapping) Ints
var currentStr, nextStr, tmpStr : String            // used for sorting (comparing and swapping) Strings
var dictKey : String                                    // used to index dictionary for school name
var tallyArr : [Int] = [0,0,0,0,0,0,0,0,0,0,0]

// *************************************************************
// Sort by state and display
// *************************************************************
// print out students sorted by state location
println("Data sorted by State location")
println("")
for (i=0; i<studentSchool.count-1; i++){
    currentMin = i
    for (j=i+1; j<studentSchool.count; j++){
        length = count(schoolLoc[currentMin])
        currentStr = schoolLoc[currentMin].substringFromIndex(advance(schoolLoc[currentMin].startIndex, length - 2))
        length = count(schoolLoc[j])
        nextStr = schoolLoc[j].substringFromIndex(advance(schoolLoc[j].startIndex, length - 2))
        if (nextStr < currentStr){
            currentMin = j
        }
    }
    
    // swap array elements (if necessary) of ALL arrays
    if (currentMin != i) {
        tmpStr = schoolLoc[i]
        schoolLoc[i] = schoolLoc[currentMin]        // school location array
        schoolLoc[currentMin] = tmpStr
        
        tmpStr = studentName[i]
        studentName[i] = studentName[currentMin]    // student name array
        studentName[currentMin] = tmpStr
        
        tmpStr = major[i]
        major[i] = major[currentMin]                // array of college majors
        major[currentMin] = tmpStr
        
        tmpInt = gradYear[i]
        gradYear[i] = gradYear[currentMin]          // array of grad years
        gradYear[currentMin] = tmpInt
                
    }
}

// Display school location, student name, and school name
for (i=0; i<studentSchool.count; i++) {
    dictKey = studentName[i]
    if let schoolName = studentSchool[dictKey]{         // removes the (Optional) from display
        println("\(schoolLoc[i]):    \(studentName[i])   \(schoolName)")
    }
}

// ***************************************
// display most popular major
// ***************************************
// process through array of majors and tally up to find most popular
for (i=0; i<studentSchool.count; i++) {
    for (j=0; j<count(MAJORS); j++) {
        if (major[i].rangeOfString(MAJORS[j]) != nil){
        tallyArr[j] += 1
        }
    }
}

// See which has most tallies
maxIndex = 0;
for (i=1; i<count(tallyArr); i++) {
    if tallyArr[i] > tallyArr[maxIndex] {
        maxIndex = i;
    }
}
// display output
println("")
println("The most popular major of the Weber kids/cousins: \(MAJORS[maxIndex])")

// **************************************
// Sort by graduation year
// **************************************
println("")
println("Data sorted by Grad Year")
println("")
for (i=0; i<studentSchool.count-1; i++){
    currentMin = i
    for (j=i+1; j<studentSchool.count; j++){
        currentInt = gradYear[currentMin]
        nextInt = gradYear[j]
         if (nextInt < currentInt){
            currentMin = j
        }
    }
    
    // swap array elements (if necessary) of ALL arrays
    if (currentMin != i) {
        tmpStr = schoolLoc[i]
        schoolLoc[i] = schoolLoc[currentMin]        // school location array
        schoolLoc[currentMin] = tmpStr
        
        tmpStr = studentName[i]
        studentName[i] = studentName[currentMin]    // student name array
        studentName[currentMin] = tmpStr
        
        tmpStr = major[i]
        major[i] = major[currentMin]                // array of college majors
        major[currentMin] = tmpStr
        
        tmpInt = gradYear[i]
        gradYear[i] = gradYear[currentMin]          // array of grad years
        gradYear[currentMin] = tmpInt
        
    }
}

// Display year, student name and school name
for (i=0; i<studentSchool.count; i++) {
    dictKey = studentName[i]
    if let schoolName = studentSchool[dictKey]{     // removes the (Optional) from display
        println("\(gradYear[i]):    \(studentName[i])   \(schoolName)")
    }
}

// *******************************
// Display sorted by family  (to be completed at a later time) 
// ******************************
//for (i=0; i<studentName.count-1; i++){
//    currentMin = i
//    for (j=i+1; j<FAMILIES.count; j++){
//        if studentName[currentMin].rangeOfString(FAMILIES[j]) != nil {
//            currentStr = FAMILIES[j]
//        }
//
//        if (nextStr < currentStr){
//            currentMin = j
//        }
//    }
//}
//// display output - student name, school, grad year
//println("")
//println("By family: ")
//println("")
