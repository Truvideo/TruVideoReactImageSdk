import Foundation
import UIKit
import TruvideoSdkImage

@objc(TruVideoReactImageSdk)
class TruVideoReactImageSdk: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    @objc(getResultPath:withResolver:withRejecter:)
    func getResultPath(path: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        let fileManager = FileManager.default

        do {
            let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let outputFolderURL = documentsURL.appendingPathComponent("output")
            if !fileManager.fileExists(atPath: outputFolderURL.path) {
                try fileManager.createDirectory(at: outputFolderURL, withIntermediateDirectories: true, attributes: nil)
            }
            let resultPath = outputFolderURL.appendingPathComponent(path).path
            resolve(resultPath)
        } catch {
            // Handle errors and reject the promise
            let error = NSError(domain: "com.yourdomain.yourapp", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to get document directory path"])
            reject("no_path", "There is no result path", error)
        }
    }

    @objc(launchImageEdit:withOutputPath:withResolver:withRejecter:)
    func launchImageEdit(inputPath: String,outputPath: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            print("E_NO_ROOT_VIEW_CONTROLLER", "No root view controller found")
            let error = NSError(domain: "com.TruvideoImageSDk.ImageSDK", code: 500, userInfo: [NSLocalizedDescriptionKey: "No root view controller found"])
            reject("E_NO_ROOT_VIEW_CONTROLLER", "No root view controller foundh",error)
            return
        }
        if let imageURL = URL(string: inputPath) as? URL ,let outputURL = URL(string: outputPath) as? URL {
            let configuration = TruvideoSdkImageEditorPreset(imageURL: imageURL, outputURL: outputURL)

            rootViewController.presentTruvideoSdkImageEditorView(preset: configuration, onComplete: { result in
                if let editedImageUrl: URL = result.editedImageURL {
                    resolve(editedImageUrl.absoluteString)
                } else{
                    let error = NSError(domain:"com.TruvideoImageSDk.ImageSDK", code: 500, userInfo: [NSLocalizedDescriptionKey: "There is no result URL"])
                    reject("NO_URL_Found", "There is no result URL", error)
                }
            })
        } else{
            let error = NSError(domain:"com.TruvideoImageSDk.ImageSDK", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to get directory path"])
            reject("NO_PATH_Found", "Failed to get directory path", error)
        }
    }

}
