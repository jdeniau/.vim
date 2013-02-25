<?php

/*
Sample atoum configuration file.
Do "php path/to/test/file -c path/to/this/file" or "php path/to/atoum/scripts/runner.php -c path/to/this/file -f path/to/test/file" to use it.
*/

use
  \mageekguy\atoum
;

/*
Write all on stdout.
*/
$stdOutWriter = new atoum\writers\std\out();

/*
Generate a CLI report.
*/
$vimReport = new atoum\reports\asynchronous\vim();
$vimReport
  ->addWriter($stdOutWriter)
;

$runner->addReport($vimReport);
