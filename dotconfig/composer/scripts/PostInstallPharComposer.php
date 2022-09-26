<?php

use Composer\Script\Event;

class PostInstallPharComposer
{
	public static function exec(Event $event)
	{
		$args = $event->getArguments();
		if (count($args) === 1) {
			$args = explode(' as ', $args[0]);
		}

		$pkg = $args[0];
		$alias = $args[1] ?? basename($pkg);

		self::updatePhar($pkg, $alias);
	}

    public static function updatePhar($pkg, $alias)
    {
		$phar_name = basename($pkg).'.phar';
        rename($phar_name, "vendor/bin/{$alias}");

        $composer_json = json_decode(file_get_contents('composer.json'));
        $phars = &$composer_json->extra->phars;
        $phar = "{$pkg} as {$alias}";

        if (!in_array($phar, $phars)) {
        	array_push($phars, $phar);
        }
        sort($phars);

        file_put_contents('composer.json', json_encode($composer_json, JSON_PRETTY_PRINT));
    }
}
