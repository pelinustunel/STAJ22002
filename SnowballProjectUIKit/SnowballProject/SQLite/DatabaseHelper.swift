//
//  DataHelper.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 3.09.2024.
//

import Foundation
import CommonCrypto
import SQLite3


struct Project {
    var id: Int
    var projectID: String
    var master: String
    var product: String
    var checkUs: String
    var person: String
    var date: String
    var status: String
}


class DatabaseHelper {
    
    var db: OpaquePointer?
    var projectAll: [Project] = []
  
    init() {
        db = createDatabase()
        createTable()
    }
    
    
    
    func createDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ccli.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            debugPrint("Cannot open DB.")
            return nil
        } else {
            print("DB successfully created.")
            return db
        }
    }
    
    
    
    func createTable() {
        let createTableString = """
                 CREATE TABLE IF NOT EXISTS Project (
                     id INTEGER PRIMARY KEY AUTOINCREMENT,
                     projectID TEXT,
                     master TEXT,
                     product TEXT,
                     checkValue TEXT,
                     person TEXT,
                     date TEXT,
                     status TEXT
                 );
             """
        
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Project table created successfully.")
            } else {
                print("Could not create table.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    
    func insert(projectID: String, master: String, product: String, checkUs: String, person: String, date: String, status: String) {
        let insertStatementString = """
                    INSERT INTO Project (projectID, master, product, checkValue, person, date, status)
                    VALUES (?, ?, ?, ?, ?, ?, ?);
                """
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let encryptedProjectID = encrypt(data: projectID.data(using: .utf8)!)
            let encryptedMaster = encrypt(data: master.data(using: .utf8)!)
            let encryptedProduct = encrypt(data: product.data(using: .utf8)!)
            let encryptedCheckUs = encrypt(data: checkUs.data(using: .utf8)!)
            let encryptedPerson = encrypt(data: person.data(using: .utf8)!)
            let encryptedDate = encrypt(data: date.data(using: .utf8)!)
            let encryptedStatus = encrypt(data: status.data(using: .utf8)!)
            
            sqlite3_bind_text(insertStatement, 1, (encryptedProjectID as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (encryptedMaster as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (encryptedProduct as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (encryptedCheckUs as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (encryptedPerson as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (encryptedDate as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, (encryptedStatus as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
            if let errorMessage = String(validatingUTF8: sqlite3_errmsg(db)) {
                print("Error: \(errorMessage)")
            }
        }
        
        sqlite3_finalize(insertStatement)
    }

    
    
    func read() {
        let queryStatementString = "SELECT * FROM Project;"
        var queryStatement: OpaquePointer? = nil
        
        projectAll.removeAll()
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                
                let encryptedProjectID = sqlite3_column_text(queryStatement, 1)
                let encryptedMaster = sqlite3_column_text(queryStatement, 2)
                let encryptedProduct = sqlite3_column_text(queryStatement, 3)
                let encryptedCheck = sqlite3_column_text(queryStatement, 4)
                let encryptedPerson = sqlite3_column_text(queryStatement, 5)
                let encryptedDate = sqlite3_column_text(queryStatement, 6)
                let encryptedStatus = sqlite3_column_text(queryStatement, 7)
                
                
                let projectID = encryptedProjectID != nil ? decrypt(data: Data(String(cString: encryptedProjectID!).utf8)) : ""
                let master = encryptedMaster != nil ? decrypt(data: Data(String(cString: encryptedMaster!).utf8)) : ""
                let product = encryptedProduct != nil ? decrypt(data: Data(String(cString: encryptedProduct!).utf8)) : ""
                let check = encryptedCheck != nil ? decrypt(data: Data(String(cString: encryptedCheck!).utf8)) : ""
                let person = encryptedPerson != nil ? decrypt(data: Data(String(cString: encryptedPerson!).utf8)) : ""
                let date = encryptedDate != nil ? decrypt(data: Data(String(cString: encryptedDate!).utf8)) : ""
                let status = encryptedStatus != nil ? decrypt(data: Data(String(cString: encryptedStatus!).utf8)) : ""
                
                let project = Project(id: Int(id), projectID: projectID, master: master, product: product, checkUs: check, person: person, date: date, status: status)
                projectAll.append(project)
            }
        } else {
            print("SELECT statement could not be prepared.")
            if let errorMessage = String(validatingUTF8: sqlite3_errmsg(db)) {
                print("Error: \(errorMessage)")
            }
        }
        
        sqlite3_finalize(queryStatement)
    }

    
    
    
    func encrypt(data: Data) -> String {
        guard let cryptData = crypt(data: data, option: CCOperation(kCCEncrypt)) else { return "" }
        return cryptData.base64EncodedString()
    }

    func decrypt(data: Data) -> String {
        guard let decryptedData = crypt(data: data, option: CCOperation(kCCDecrypt)) else { return "" }
        return String(bytes: decryptedData, encoding: .utf8) ?? ""
    }

    
    
    
    
    private func crypt(data: Data, option: CCOperation) -> Data? {
        let keyLength = kCCBlockSizeAES128
        let key = "1234567890123456".data(using: .utf8)!
        let iv = "abcdefghijklmnop".data(using: .utf8)!
        let cryptLength = size_t(data.count + kCCBlockSizeAES128)
        var cryptData = Data(count: cryptLength)
        
        var numBytesEncrypted: size_t = 0
        let cryptStatus = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(option,
                                CCAlgorithm(kCCAlgorithmAES128),
                                CCOptions(kCCOptionPKCS7Padding),
                                keyBytes.baseAddress, keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, data.count,
                                cryptBytes.baseAddress, cryptLength,
                                &numBytesEncrypted)
                    }
                }
            }
        }
        
        guard cryptStatus == kCCSuccess else {
            print("Error: Failed to crypt data. Status \(cryptStatus)")
            return nil
        }
        
        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        return cryptData
    }
}
