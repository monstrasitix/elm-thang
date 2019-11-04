// Core
const path = require('path');


// Plugins
const HtmlWebpack = require('html-webpack-plugin');


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
        new HtmlWebpack({
            filename: 'index.html',
            template: './src/index.html',
        })
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