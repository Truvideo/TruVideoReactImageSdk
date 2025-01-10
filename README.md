# truvideo-react-image-sdk

none

## Installation

```sh
npm install https://github.com/Truvideo/TruVideoReactImageSdk.git

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
