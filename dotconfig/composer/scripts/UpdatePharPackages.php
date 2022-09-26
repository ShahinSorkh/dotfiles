<?php

// require_once dirname(__DIR__).'/vendor/autoload.php';

use Composer\Script\Event;
use Composer\Command\ExecCommand;

class UpdatePharPackages
{
	public static function exec(Event $event)
	{
		$composer_json = json_decode(file_get_contents('composer.json'));
		$phar_pkgs = $composer_json->extra->phars;
		foreach ($phar_pkgs as $pkg) {
			self::updatePackage($event, $pkg);
		}
	}

	private static function updatePackage(Event $event, $pkg)
	{
		$as_pos = strpos($pkg, ' as ');
		if ($as_pos === false) {
			$alias = basename($pkg);
		} else {
			$alias = substr($pkg, $as_pos + 4);
			$pkg = substr($pkg, 0, $as_pos);
		}

		$event->getComposer()
			  ->getEventDispatcher()
			  ->dispatchScript('build-phar', false, [$pkg]);
		PostInstallPharComposer::updatePhar($pkg, $alias);
	}
}
