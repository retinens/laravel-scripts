#!/bin/bash -i
RETINENS_SCRIPTS_FOLDER=$(cd $(dirname $0) && pwd)
$projectname = pwd
#$RETINENS_SCRIPTS_FOLDER/check-updates

echo -e "\e[33m
  _____  ______ _______ _____ _   _ ______ _   _  _____
 |  __ \|  ____|__   __|_   _| \ | |  ____| \ | |/ ____|
 | |__) | |__     | |    | | |  \| | |__  |  \| | (___
 |  _  /|  __|    | |    | | | . \` |  __| | . \` |\___ \\
 | | \ \| |____   | |   _| |_| |\  | |____| |\  |____) |
 |_|  \_\______|  |_|  |_____|_| \_|______|_| \_|_____/
\e[0m"

npm install @coreui/coreui sweetalert jquery-validation select2 @ttskch/select2-bootstrap4-theme datatables.net datatables.net-bs4 toastr --save

echo -e "Editing\e[32m webpack.mix.js\e[0m to work with our boilerplate and setting up \e[32mbrowser-sync\e[0m"

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

if (['admin'].includes(process.env.npm_config_section)) {

    mix.js('resources/admin/js/admin.js', 'public/backend/js')
        .extract().mergeManifest();

    mix.sass('resources/admin/sass/admin.scss', 'public/backend/css');
    mix.copyDirectory('node_modules/tinymce/plugins', 'public/node_modules/tinymce/plugins');
    mix.copyDirectory('node_modules/tinymce/skins', 'public/node_modules/tinymce/skins');
    mix.copyDirectory('node_modules/tinymce/themes', 'public/node_modules/tinymce/themes');
    mix.copy('node_modules/tinymce-i18n/langs5/fr_FR.js', 'public/node_modules/tinymce/langs/fr_FR.js');
    mix.copy('node_modules/tinymce/jquery.tinymce.js', 'public/node_modules/tinymce/jquery.tinymce.js');
    mix.copy('node_modules/tinymce/jquery.tinymce.min.js', 'public/node_modules/tinymce/jquery.tinymce.min.js');
    mix.copy('node_modules/tinymce/tinymce.js', 'public/node_modules/tinymce/tinymce.js');
    mix.copy('node_modules/tinymce/tinymce.min.js', 'public/node_modules/tinymce/tinymce.min.js');
} else {
    mix.js('resources/app/js/app.js', 'public/app/js')
        .extract().mergeManifest().version();
    mix.sass('resources/app/sass/app.scss', 'public/app/css').version();
}" >webpack.mix.js
