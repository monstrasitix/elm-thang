// Plugins
const merge = require('webpack-merge');


// Common
const { common } = require('./webpack.common');


module.exports = merge(common, {
    mode: 'production',
});