//
//  FileClient.swift
//  Taro
//
//  Created by DevMountain on 1/31/21.
//

import Foundation

public struct FileClient {
    
    // MARK: - Public API
    public let loadFile: (String) -> Data?
    
    public let saveFile: (Data, String) -> Void
    
    
    public init(loadFile: @escaping (String) -> Data?,
                  saveFile: @escaping (Data, String) -> Void) {
        self.loadFile = loadFile
        self.saveFile = saveFile
    }
    
    
    // MARK: - Private API
    private static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    // MARK: - Implementations
    
    public static let localFileClient = FileClient { path in
        let url = Self.documentsDirectory.appendingPathComponent(path)
        return try? Data(contentsOf: url)
    } saveFile: { (data, path) in
        let url = Self.documentsDirectory.appendingPathComponent(path)
        try? data.write(to: url)
    }
    
    public static let defaultsFileClient = FileClient { key in
        UserDefaults.standard.data(forKey: key)
    } saveFile: { (data, key) in
        UserDefaults.standard.set(data, forKey: key)
    }

    
    public static let stubFileClient = FileClient { path in
        return Data()
    } saveFile: { (data, path) in
        // no-op
    }
}
