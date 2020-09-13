<?php
use App\Models\System;

$system = System::row();

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ $system->name }}</title>
  <link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="/makeup/system">
  @yield('makeup')
  <script type="text/javascript" charset="utf-8" src="/helper/helper.js"></script>
  <script type="text/javascript" charset="utf-8" src="/behavior/system"></script>
  <script type="text/javascript" charset="utf-8" src="/behavior/components"></script>
  @yield('behavior')
</head>
<body>
<header>
@yield('header')
</header>
<section>
@yield('content')
</section>
<footer>
@yield('footer')
</footer>
</body>
</html>