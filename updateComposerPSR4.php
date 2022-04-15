#!/usr/bin/php
<?php

$file = 'composer.json';
$data = json_decode(file_get_contents($file), true);
$data["autoload"]["psr-4"]["Domain\\"] = 'domain/';
file_put_contents($file, json_encode($data, JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT));
