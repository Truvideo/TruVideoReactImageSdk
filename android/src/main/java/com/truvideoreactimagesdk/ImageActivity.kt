package com.truvideoreactimagesdk

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.truvideo.sdk.image.ui.edit.activities.edit.TruvideoSdkImageEditContract
import com.truvideo.sdk.image.ui.edit.activities.edit.TruvideoSdkImageEditParams
import com.truvideoreactimagesdk.TruVideoReactImageSdkModule.Companion.mainPromise
import com.truvideoreactimagesdk.ui.theme.TruvideoreactimagesdkexampleTheme

class ImageActivity : ComponentActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    enableEdgeToEdge()
    setContent {
      TruvideoreactimagesdkexampleTheme {}
    }
    val inputPath = intent.getStringExtra("inputPath")
    val outputPath = intent.getStringExtra("outputPath")


    var launcher = registerForActivityResult(TruvideoSdkImageEditContract()){
        resultPathh: String? ->
      mainPromise!!.resolve(resultPathh)
    }

    launcher.launch(TruvideoSdkImageEditParams(inputPath!!,outputPath!!))
    finish()
  }
}
