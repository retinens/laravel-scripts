# After running the website creation script

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
2. Add the new disks in the config file (`config/filesystems.php`):
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
3. Change the {bucketName} in the `.github/workflows/deploy.yml` file (around line 83)
4. Set the variables (DIGITALOCEAN_SPACES_KEY, DIGITALOCEAN_SPACES_SECRET, DEVELOP_WEBHOOK and PROD_WEBHOOK) in the Github repo so the automatic assets compilation will work.

##
