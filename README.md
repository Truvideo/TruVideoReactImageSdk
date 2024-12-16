# truvideo-react-video-sdk

none

## Installation

```sh
"dependencies": {
  // replace token with your personal access token
    "truvideo-react-image-sdk": "git+https://<token>@github.com/Truvideo/TruVideoReactImageSdk.git#release-version-76"
}

//or
npm install truvideo-react-image-sdk
```

## Usage


```js
import { launchImageEdit,getFilePath } from 'truvideo-react-image-sdk';

// ...

launchImageEdit(inputPath: string, outputPath: string)
      .then((result) => {
        console.log('result', result);
      })
      .catch((error) => {
        console.log('error', error);
      });
getFilePath(fileName: string)
      .then((result) => {
        console.log('result', result);
      })
      .catch((error) => {
        console.log('error', error);
      });

```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
