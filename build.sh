#!/usr/bin/env sh
browserify -t coffeeify --extension=".coffee" mz.coffee > mz.js
