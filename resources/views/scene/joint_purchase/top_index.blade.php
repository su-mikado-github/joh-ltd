@extends('scene.layout.with_left')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="/behavior/top"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
	@header_menu(['id'=>'pnlHeaderMenu'])
	@endheader_menu
@endsection

@section('left_side')
	@side_menu_a(['id'=>'pnlSideMenu'])
	@endside_menu_a
@endsection

@section('content')
<div class="JOH-W-Full JOH-P-SSEM">
<nav class="JOH-W-Full JOH-Flex Column-TL" style="position:relative;transform-origin:left top;transform:scale(0.9, 0.9);">
<div style="position:relative;border-radius:16px;width:480px;height:640px;background-color:#cccccc;">
<h1>テスト</h1>
</div>
<div style="position:relative;border-radius:16px;width:480px;height:640px;background-color:#cccccc;margin-left:1em;">
<h1>テスト</h1>
</div>
<div style="position:relative;border-radius:16px;width:480px;height:640px;background-color:#cccccc;margin-left:1em;">
<h1>テスト</h1>
</div>
</nav>
<section class="JOH-W-Full JOH-Flex Column-TL" style="position:relative;transform-origin:left top;transform:scale(0.75, 0.75);">
<div style="position:relative;border-radius:16px;width:30%;height:340px;background-color:#cccccc;">
<h1>テスト</h1>
</div>
<div style="position:relative;border-radius:16px;width:30%;height:340px;background-color:#cccccc;margin-left:1em;">
<h1>テスト</h1>
</div>
<div style="position:relative;border-radius:16px;width:30%;height:340px;background-color:#cccccc;margin-left:1em;">
<h1>テスト</h1>
</div>
<div style="position:relative;border-radius:16px;width:30%;height:340px;background-color:#cccccc;margin-left:1em;">
<h1>テスト</h1>
</div>
</section>
<nav class="JOH-W-Full JOH-IPos-Center">
  <dl class="JOH-Horizontal JOH-Inline-Block">
    <dt>« 前</dt>
    <dd>1</dd>
    <dd>2</dd>
    <dd>3</dd>
    <dd>...</dd>
    <dd>15</dd>
    <dt>次 »</dt>
  </dl>
  <br>
  <div class="JOH-Inline-Block">1-40 全598件</div>
</nav>
</div>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
