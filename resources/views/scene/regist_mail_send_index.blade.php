
@extends('scene.layout.normal')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="/behavior/user_regist"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
@endsection

@section('content')
<article class="JOH-Flex Rows-CC" style="padding:1em;align-items:center;">
    <section class="JOH-Flex Rows-CC" style="padding:2em;">
      <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">認証メールを送信しました。</h1>

      <p class="JOH-Font-M JOH-LineH-LL JOH-IPos-Center" style="margin-bottom:1em;">
      {{ $to_address }} に認証メールをお送りしました。<br>
      メールに記載された認証URLをクリックして新規会員登録を完了させてください。
      </p>

      <p class="JOH-Font-S JOH-LineH-L JOH-IPos-Center" style="margin-bottom:1em;">
      メールが届いていない場合、メールアドレスが間違っていたか、<br>
      何らかの不具合によりメールが送信されなかった恐れがあります。<br>
      大変お手数ですが@link([ 'link_item_id'=>'user_regist', 'class'=>'JOH-Font-S JOH-Color-Link-Text', 'style'=>'text-decoration:underline;margin-bottom:2em;' ])@endlinkから再度ご入力いただくか、@link([ 'link_item_id'=>'customer_support', 'class'=>'JOH-Font-S JOH-Color-Link-Text', 'style'=>'text-decoration:underline;margin-bottom:2em;' ])@endlinkまでご連絡ください。
      </p>
    </section>
</article>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
