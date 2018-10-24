###################################
#
#  安裝 ide-helper
#
###################################
#!/bin/bash

./composer-php-fpm.sh require --dev barryvdh/laravel-ide-helper
sed -i '/"scripts": {/r scripts-for-ide-helper.txt' ../site/composer.json
./php-artisan.sh ide-helper:generate
./php-artisan.sh ide-helper:meta
./php-artisan.sh vendor:publish --provider="Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider" --tag=config
sed -i "s/'include_fluent' => false/'include_fluent' => true/g" ../site/config/ide-helper.php