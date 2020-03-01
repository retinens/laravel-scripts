#!/bin/bash -i
echo -e "Installing fontawesome-pro"
npm install --save @fortawesome/fontawesome-pro

echo "@import \"~@fortawesome/fontawesome-pro/css/all.css\";" >> resources/app/sass/vendors/retinens-vendors.scss 

npm run dev
