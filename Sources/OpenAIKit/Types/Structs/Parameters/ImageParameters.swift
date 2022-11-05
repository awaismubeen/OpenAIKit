//
//  File.swift
//  
//
//  Created by Marcus Arnett on 11/4/22.
//

public struct ImageParameters {
    let prompt: String
    let numberOfImages: Int
    let resolution: ImageResolutions
    let responseFormat: ResponseFormat
    let user: String?
    
    public init(
        prompt: String,
        @Clamped(range: 1...10) numberofImages: Int = 1,
        resolution: ImageResolutions = .large,
        responseFormat: ResponseFormat = .url,
        user: String? = nil
    ) {
        self.prompt = prompt
        self.numberOfImages = numberofImages
        self.resolution = resolution
        self.responseFormat = responseFormat
        self.user = user
    }
    
    public var body: [String: Any] {
        var result: [String: Any] = ["prompt": prompt,
                                     "n": numberOfImages,
                                     "size": resolution.rawValue,
                                     "response_format": responseFormat.rawValue]
        if let user = user {
            result["user"] = user
        }
        
        return result
    }
}