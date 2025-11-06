const path = require('path');
const exclusionList = require('metro-config/src/defaults/exclusionList');

const root = path.resolve(__dirname, '.');

module.exports = {
  projectRoot: path.join(root, 'example'),
  watchFolders: [root],
  resolver: {
    blacklistRE: exclusionList([/node_modules\/react-native\/.*/]),
    extraNodeModules: {
      'react-native': path.resolve(root, 'node_modules/react-native'),
    },
  },
};
