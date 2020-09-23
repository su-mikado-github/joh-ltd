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
      <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">２ステップで簡単登録</h1>
      <table>
      <tbody>
        <tr>
          <td class="JOH-PH-XSEM"><img src="/images/mail.svg" style="width:48px;"></td><td class="JOH-PH-XSEM JOH-Color-Label-WarningText">STEP1</td><td class="JOH-PH-XSEM JOH-Color-Label-WarningText">メールアドレス登録</td>
        </tr>
        <tr>
          <td>&nbsp;</td><td class="JOH-IPos-Center"><img src="/images/arrow_to_bottom.svg" style="width:24px;"></td><td>&nbsp;</td>
        </tr>
        <tr>
          <td class="JOH-PH-XSEM"><img src="/images/document.svg" style="width:48px;"></td><td class="JOH-PH-XSEM JOH-Color-Label-WarningText">STEP2</td><td class="JOH-PH-XSEM JOH-Color-Label-WarningText">お客様情報入力</td>
        </tr>
      </tbody>
      </table>
    </section>

    <hr class="JOH-Border-Bottom-1 JOH-Color-Panel-Separator JOH-W12-6 JOH-MV-XSEM">

    <section class="JOH-Block" style="padding:2em;">
      <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">新規会員登録（無料）</h1>

      <dl class="JOH-W-Full">
        <dt style="margin-bottom:1em;"><label for="txtMailAddress">メールアドレスを入力してください。<br>入力したメールアドレスへ認証メールが自動送信されます。</label></dt>
        <dd style="margin-bottom:1em;">
          <input id="txtMailAddress" data-id="txtMailAddress" type="email" data-item_id="mailAddress" class="JOH-Font-M JOH-Border-1 JOH-Color-Form-Text JOH-P-SSEM" style="width:600px;" placeholder="メールアドレス">
        </dd>
        <dt style="margin-bottom:1em;">
        <p class="JOH-Font-SS">ご提供いただいた個人情報は@link([ 'link_id'=>'keyword','link_item_id'=>'service_name' ])@endlinkに会員登録し、<br>
        各種のサービス提供やお問合わせ対応のほか、以下に記載する目的のために利用いたします。<br>
        個人情報の取り扱いについては、@link([ 'link_item_id'=>'here', 'class'=>'JOH-Color-Link-Text', 'style'=>'text-decoration:underline;' ])@endlinkをご覧ください。
        </p>
        </dt>
        <dd style="margin-bottom:1em;">
          <button id="btnSendMail" data-id="btnSendMail" type="button" class="JOH-Font-M JOH-Color-Button-Main JOH-Border-3 JOH-P-SSEM" style="width:600px;">上記に同意して認証メールを送信する</button>
        </dd>
      </dl>
    </section>

    <p class="JOH-Font-S JOH-Color-Label-WarningText" style="margin-bottom:2em;">※迷惑メール対策やドメイン指定受信をされている方は、当社からのメール（@link([ 'link_id'=>'keyword','link_item_id'=>'mail_domain' ])@endlink）を受け取れるよう設定してください</p>

    <p class="JOH-Font-S JOH-IPos-Center" style="margin-bottom:2em;">当サイトはSSLに対応しています。<br>当サイトのフォームはお客様の大切な情報を暗号化して送信しています。<br>安心してご利用ください。</p>

    @link([ 'link_item_id'=>'registered', 'class'=>'JOH-Font-S JOH-Color-Link-Text', 'style'=>'text-decoration:underline;margin-bottom:2em;' ])@endlink
</article>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
