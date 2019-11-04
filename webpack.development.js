// Plugins
const merge = require('webpack-merge');


// Common
const { common, root } = require('./webpack.common');


module.exports = merge(common, {
    mode: 'development',
    devServer: {
        port: 8000,
        hot: true,
        inline: true,
        publicPath: '/',
        contentBase: root('./src'),
    },
});