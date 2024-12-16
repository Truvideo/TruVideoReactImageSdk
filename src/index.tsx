import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'truvideo-react-image-sdk' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const TruVideoReactImageSdk = NativeModules.TruVideoReactImageSdk
  ? NativeModules.TruVideoReactImageSdk
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return TruVideoReactImageSdk.multiply(a, b);
}

export function launchImageEdit(
  inputPath: string,
  outputPath: string
): Promise<string> {
  return TruVideoReactImageSdk.launchImageEdit(inputPath, outputPath);
}

export function getFilePath(fileName: String): Promise<string> {
  return TruVideoReactImageSdk.getResultPath(fileName);
}
