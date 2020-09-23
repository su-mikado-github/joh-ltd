@extends('scene.layout.normal')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="/behavior/attest"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
@endsection

@section('content')
<article class="JOH-Flex Columns-CC" style="padding:1em;">
    <section class="JOH-Block" style="width:580px;padding:2em;">
    <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">ログイン</h1>

    <dl class="JOH-W-Full">
    <dt><label for="txtLoginId">メールアドレス</label></dt>
    <dd style="margin-bottom:1em;">
      <input id="txtLoginId" data-id="txtLoginId" type="email" data-item_id="loginId" class="JOH-W-Full JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;" placeholder="メールアドレス">
      <p class="JOH-W-Full JOH-Font-SS" style="color:#00a0e8;">メールアドレスを忘れた方はお客様サポートまで</p>
    </dd>
    <dt><label for="txtLoginPassword">パスワード</label></dt>
    <dd style="margin-bottom:1em;">
      <input id="txtLoginPassword" data-id="txtLoginPassword" type="password" data-item_id="loginPw" class="JOH-W-Full JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;" placeholder="パスワード">
      <p class="JOH-Font-SS" style="color:#00a0e8;">パスワードを忘れた方はこちら</p>
    </dd>
    </dl>
    <div class="JOH-W-Full">
      <button id="btnGoLogin" data-id="btnGoLogin" class="JOH-W-Full JOH-Font-M JOH-Color-Button-Main JOH-Border-3" style="padding:0.5em;">ログイン</button>
      <p class="JOH-Font-SS JOH-IPos-Center" style="padding:0.25em;"><input id="chkRememberMe" data-id="chkRememberMe" type="checkbox" value="1" checked><label for="chkRememberMe">&nbsp;ログインしたままにする</label></p>
    </div>
    <hr style="margin:1.5em 0px;border-top:1px dotted #8c8b8b;">
    <div class="JOH-W-Full" style="margin-bottom:1em;">
      <a class="JOH-W-Full JOH-Font-M JOH-Color-Button-Sub JOH-Border-3 JOH-P-XSEM">新規会員登録（無料）</a>
    </div>
    </section>
</article>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
