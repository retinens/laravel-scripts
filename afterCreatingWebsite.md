# After running the website creation script

## Setup Lasso config

After creating a new bucket (Space) in DigitalOcean, do the following:

Add the env variables to the .env file:
```diff
DIGITALOCEAN_SPACES_KEY=##
DIGITALOCEAN_SPACES_SECRET=##
DIGITALOCEAN_SPACES_ENDPOINT=https://ams3.digitaloceanspaces.com
DIGITALOCEAN_SPACES_URL=https://{bucketName}.ams3.digitaloceanspaces.com
DIGITALOCEAN_SPACES_REGION=ams3
DIGITALOCEAN_SPACES_BUCKET={bucketName}
DIGITALOCEAN_ROOT_FOLDER={folderName}
```

Add the new disks in the config file (`config/filesystems.php`):
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

'digitalocean' => [
    'driver' => 's3',
    'key' => env('DIGITALOCEAN_SPACES_KEY'),
    'secret' => env('DIGITALOCEAN_SPACES_SECRET'),
    'region' => env('DIGITALOCEAN_SPACES_REGION'),
    'bucket' => env('DIGITALOCEAN_SPACES_BUCKET'),
    'url' => env('DIGITALOCEAN_SPACES_URL'),
    'endpoint' => env('DIGITALOCEAN_SPACES_ENDPOINT'),
    "root" => env('DIGITALOCEAN_SPACES_ROOT'),
    'visibility' => 'public',
],

```

Change the config/lasso.php

```diff
'excluded_files' => [
    'hot', 'site.webmanifest', "favicon.ico", "favicon-32x32.png", "favicon-16x16.png", "apple-touch-icon.png", "android-chrome-512x512.png", "android-chrome-192x192.png", "safari-pinned-tab.svg", "favicon.ico", "favicon-32x32.png", "favicon-16x16.png", "apple-touch-icon.png", "android-chrome-512x512.png", "android-chrome-192x192.png", "safari-pinned-tab.svg", "favicon.ico", "favicon-32x32.png", "favicon-16x16.png", "apple-touch-icon.png", "android-chrome-512x512.png", "android-chrome-192x192.png", "safari-pinned-tab.svg", "favicon.ico", "favicon-32x32.png", "favicon-16x16.png", "apple-touch-icon.png", "android-chrome-512x512.png", "android-chrome-192x192.png", "safari-pinned-tab.svg", "favicon.ico", "favicon-32x32.png", "favicon-16x16.png", "apple-touch-icon.png", "android-chrome-512x512.png", "android-chrome-192x192.png", "safari-pinned-tab.svg"
],

'excluded_directories' => [
    "images", "vendor", 'fonts'
],

```

##
