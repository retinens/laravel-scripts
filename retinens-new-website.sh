#!/bin/bash
set -e

RETINENS_SCRIPTS_FOLDER=$(cd `dirname $0` && pwd)

$RETINENS_SCRIPTS_FOLDER/check-updates.sh

echo "\e[33mRETINENS WEB\e[0m"

echo "New laravel project script\n"
echo "Project name ?"
read projectname

if [ -d "$projectname" ]; then
    echo "\e[31mERROR \e[0m: $projectname directory already exists."
    exit;
fi

echo "\n\e[32mInstalling Laravel\e[0m in $projectname"
composer create-project laravel/laravel "$projectname" --quiet
cd "$projectname"

echo "Getting \e[32mbasic libraries\e[0m for Laravel (SEOTools & laravel-cookie-consent)"
composer require artesaos/seotools spatie/laravel-cookie-consent --quiet


echo "Installing \e[32mLaravel UI\e[0m & \e[32mBootstrap \e[0m"
composer require laravel/ui --quiet
php artisan ui bootstrap --quiet
npm install --silent



echo "Setting up \e[32msass\e[0m boilerplate"
mkdir resources/app
mv resources/js resources/app
rm resources/sass -rf

git clone --depth=1 git://github.com/retinens/laravel-sass-boilerplate resources/app/sass --quiet && rm resources/app/sass/.git -rf

echo "Setting up \e[32mviews\e[0m boilerplate"

rm resources/views -rf
git clone --depth=1 git://github.com/retinens/laravel-views-boilerplate resources/views --quiet && rm resources/views/.git -rf

echo "Editing\e[32m webpack.mix.js\e[0m to work with our boilerplate and setting up \e[32mbrowser-sync\e[0m"

echo "
const mix = require('laravel-mix');
require('laravel-mix-merge-manifest');

const domain = '$projectname.test'; 
const homedir = require('os').homedir();
mix.browserSync({
    proxy: 'https://' + domain,
    host: domain,
    open: 'external',
    https: {
        key: homedir + '/.valet/Certificates/' + domain + '.key',
        cert: homedir + '/.valet/Certificates/' + domain + '.crt',
    },
});

mix.js('resources/app/js/app.js', 'public/app/js').extract().mergeManifest();
    mix.sass('resources/app/sass/app.scss', 'public/app/css');" > webpack.mix.js

echo "Compiling assets"
npm i laravel-mix-merge-manifest --save
npm run dev
npm run dev

echo "Setting up git repo"

git init
echo "/.idea" >> .gitignore
git add . 
git commit -m "First commit" --quiet

echo "Create now a repository on github\n"
echo "URL of the git repository ?"
read gitUrl

#git remote add origin $gitUrl
#git push -u origin master

echo "Setting up valet"
valet secure
valet open
