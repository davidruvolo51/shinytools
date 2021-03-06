////////////////////////////////////////////////////////////////////////////////
// FILE: webpack.common.js
// AUTHOR: David Ruvolo
// CREATED: 2020-09-25
// MODIFIED: 2020-11-06
// PURPOSE: configuration to be used in prod and dev
// DEPENDENCIES: see below
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// load
const { CleanWebpackPlugin } = require("clean-webpack-plugin");
// const HtmlWebpackPlugin = require("html-webpack-plugin");
const webpack = require("webpack");
const path = require("path");

// configuration
module.exports = {
    entry: "./src/index.js",
    output: {
        filename: "browsertools.min.js",
        path: path.join(__dirname, "..", "inst/browsertools/public/"),
    }  ,
    plugins: [
        new webpack.ProgressPlugin(),
        new CleanWebpackPlugin(),
        // new HtmlWebpackPlugin({
        //     title: "browsertools"
        // })
    ],
    module: {
        rules: [
            {
                test: /\.js$/,
                use: "babel-loader",
                exclude: /node_modules/,
            }
        ]
    }
}
