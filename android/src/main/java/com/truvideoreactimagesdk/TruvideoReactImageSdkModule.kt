package com.truvideoreactimagesdk

import android.content.Intent
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import java.io.File

class TruVideoReactImageSdkModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }


  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

  @ReactMethod
  fun getResultPath(fileName: String,promise: Promise) {
    // get result path with dynamic name
    val basePath  = reactApplicationContext.filesDir
    promise.resolve( File("$basePath/$fileName").path)
  }

  @ReactMethod
fun launchImageEdit(inputPath : String, outputPath: String, promise: Promise){
    mainPromise = promise
    val activity = reactApplicationContext.currentActivity
    if (activity != null) {
        val intent = Intent(reactApplicationContext, ImageActivity::class.java)
        intent.putExtra("inputPath", inputPath)
        intent.putExtra("outputPath", outputPath)
        activity.startActivity(intent)
    } else {
        promise.reject("E_ACTIVITY_DOES_NOT_EXIST", "Activity doesn't exist")
    }
}

  companion object {
    var mainPromise : Promise? = null
    const val NAME = "TruVideoReactImageSdk"
  }
}
