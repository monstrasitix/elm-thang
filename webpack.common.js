// Core
const path = require('path');


// Plugins
const HtmlWebpack = require('html-webpack-plugin');
const WorkboxWebpack = require('workbox-webpack-plugin');
const CleanWebpack = require('clean-webpack-plugin');


const root = path.resolve.bind(undefined, __dirname);


const rule = object => ({
    ...object,
    exclude: [
        /elm-stuff/,
        /node_modules/,
    ]
});


const common = {
    target: 'web',
    entry: {
        app: root('./src/index.js'),
    },
    output: {
        filename: '[name].js',
        path: root('./dist'),
    },
    module: {
        rules: [
            rule({
                test: /\.js$/,
                use: 'babel-loader',
            }),
            rule({
                test: /\.scss$/,
                use: [
                    'style-loader',
                    'css-loader',
                    'sass-loader',
                ],
            }),
            rule({
                test: /\.elm$/,
                use: 'elm-webpack-loader',
            }),
        ],
    },
    plugins: [
        new CleanWebpack.CleanWebpackPlugin(),
        new HtmlWebpack({
            filename: 'index.html',
            template: './src/index.html',
        }),
        new WorkboxWebpack.InjectManifest({
            swDest: 'service-worker.js',
            swSrc: './src/service-worker.js',
        }),
    ],
    resolve: {
        extensions: [
            '.js',
            '.elm',
            '.scss',
            '.json',
        ],
    },
};


module.exports = {
    root,
    rule,
    common,
};