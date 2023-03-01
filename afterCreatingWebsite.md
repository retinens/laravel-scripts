# After running the website creation script


## Removing Laravel Vite
1. Go to the website directory and run `npm install --save-dev laravel-mix`
2. Update your NPM scripts in package.json:
```diff
"scripts" : {
    "dev": "npm run development",
    "development": "mix",
    "watch": "mix watch",
    "watch-poll": "npm run watch -- --watch-poll",
    "watch-admin": "npm run watch --section=admin ",
    "hot": "mix watch --hot",
    "prod": "npm run production",
    "prod-all": "npm run production && npm run production --section=admin",
    "dev-all": "npm run dev && npm run dev --section=admin",
    "production": "mix --production"
}
```
3. Run `npm remove vite laravel-vite-plugin`
4. Run `rm vite.config.js`
5. Run `npm install`
6. Run `npm run prod-all` to compile everything. You may have to run it twice or to run run `npm run install` between two runs.


## Setup Lasso config

After creating a new bucket (Space) in DigitalOcean, do the following:

1. Add the env variables to the .env file:
```diff
DIGITALOCEAN_SPACES_KEY=##
DIGITALOCEAN_SPACES_SECRET=##
DIGITALOCEAN_SPACES_ENDPOINT=https://ams3.digitaloceanspaces.com
DIGITALOCEAN_SPACES_URL=https://{bucketName}.ams3.digitaloceanspaces.com
DIGITALOCEAN_SPACES_REGION=ams3
DIGITALOCEAN_SPACES_BUCKET={bucketName}
DIGITALOCEAN_ROOT_FOLDER={folderName}
```
2. Add a new item in the filesystems disks in the config file (`config/filesystems.php`):
```diff
'assets' => [
    'driver' => 's3',
    'key' => env('DIGITALOCEAN_SPACES_KEY'),
    'secret' => env('DIGITALOCEAN_SPACES_SECRET'),
    'region' => env('DIGITALOCEAN_SPACES_REGION'),
    'bucket' => env('DIGITALOCEAN_SPACES_BUCKET'),
    'url' => env('DIGITALOCEAN_SPACES_URL'),
    'endpoint' => env('DIGITALOCEAN_SPACES_ENDPOINT'),
],
```
3. Change the {bucketName} in the `.github/workflows/deploy.yml` file (around line 83)
4. Set the variables (DIGITALOCEAN_SPACES_KEY, DIGITALOCEAN_SPACES_SECRET, DEVELOP_WEBHOOK and PROD_WEBHOOK) in the Github repo so the automatic assets compilation will work.

##
