{{-- システム全体で共有するスタイル --}}
*
{
	font-family: "Meiryo UI", "M PLUS Rounded 1c";
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	border: 0px none transparent;
	background-color: transparent;
}

html
{
	font-size: 16pt;
}

div
{
	display: inline-block;
}

{{-- アンカーリンク／ボタン --}}
a
{
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

a:hover
, button:hover
, input[type=button]:hover
, input[type=submit]:hover
, input[type=reset]:hover
, input[type=image]:hover
{
	filter: brightness(130%);
}

a:focus
, button:focus
, input[type=button]:focus
, input[type=submit]:focus
, input[type=reset]:focus
, input[type=image]:focus
{
	filter: brightness(130%);
}

{{-- Google fonts --}}
/*
.wf-mplus1p { font-family: "M PLUS 1p"; }
.wf-roundedmplus1c { font-family: "M PLUS Rounded 1c"; }
*/

a
{
	color: inherit;
}

{{-- 入力装飾 --}}
span.JOH-Input-Marker
{
	display: none;
	border-radius: 4px;
	font-size: 8pt;
	color: white;
	padding: 2px 4px;
	vertical-align: middle;
	margin: 0px 4px;
}

.JOH-Input-Required > span.JOH-Input-Marker
{
	display: inline-block;
	background-color: red;
}

.JOH-Input-Any > span.JOH-Input-Marker
{
	display: inline-block;
	background-color: blue;
}

.JOH-Input-Error
{
	border: 1px solid red !important;
}

{{-- 横並び --}}
dl.JOH-Horizontal
{
	white-space: nowrap;
}

dl.JOH-Horizontal > dt
, dl.JOH-Horizontal > dd
{
	display: table-cell;
/*
	padding-left: 1em;
	padding-right: 1em;
*/
}

dl.JOH-Horizontal.Separated > dt
{
    border-left: 1px solid {!! $color_palette['Border-Separated']->border_color !!};
}

dl.JOH-Horizontal.Separated > *:first-child
{
    border-left: 0px none transparent;
}

{{-- 縦並び --}}
dl.JOH-Virtical
{
}

dl.JOH-Virtical > dt
, dl.JOH-Virtical > dd
{
	display: block;
/*
	padding-top: 0.25em;
	padding-bottom: 0.25em;
*/
}

dl.JOH-Virtical.Separated > dt
{
    border-top: 1px solid {!! $color_palette['Border-Separated']->border_color !!};
}

dl.JOH-Virtical.Separated > *:first-child
{
    border-top: 0px none transparent;
}

{{-- マージン --}}
<?php foreach (['XS'=>1, 'SS'=>2, 'S'=>3, 'M'=>4, 'L'=>5, 'LL'=>6, 'XL'=>7 ] as $key => $i) { ?>
.JOH-MH-<?=$key ?>PX
{
	margin-left: <?=$i*2 ?>px;
	margin-right: <?=$i*2 ?>px;
}

.JOH-MV-<?=$key ?>PX
{
	margin-top: <?=$i*2 ?>px;
	margin-bottom: <?=$i*2 ?>px;
}

.JOH-MH-<?=$key ?>EM
{
	margin-left: <?=$i/2 ?>em;
	margin-right: <?=$i/2 ?>em;
}

.JOH-MV-<?=$key ?>EM
{
	margin-top: <?=$i/2 ?>em;
	margin-bottom: <?=$i/2 ?>em;
}

.JOH-M-<?=$key ?>PX
{
	margin: <?=$i*2 ?>px;
}

.JOH-M-<?=$key ?>EM
{
	margin: <?=$i/2 ?>em;
}
<?php } ?>

{{-- パディング --}}
.JOH-PH-0
{
	padding-left: 0px;
	padding-right: 0px;
}

.JOH-PV-0
{
	padding-top: 0px;
	padding-bottom: 0px;
}

.JOH-P-0
{
	padding: 0px;
}

<?php foreach (['XS'=>1, 'SS'=>2, 'S'=>3, 'M'=>4, 'L'=>5, 'LL'=>6, 'XL'=>7 ] as $key => $i) { ?>
.JOH-PH-<?=$key ?>PX
{
	padding-left: <?=$i*2 ?>px;
	padding-right: <?=$i*2 ?>px;
}

.JOH-PV-<?=$key ?>PX
{
	padding-top: <?=$i*2 ?>px;
	padding-bottom: <?=$i*2 ?>px;
}

.JOH-PH-<?=$key ?>EM
{
	padding-left: <?=$i/2 ?>em;
	padding-right: <?=$i/2 ?>em;
}

.JOH-PV-<?=$key ?>EM
{
	padding-top: <?=$i/2 ?>em;
	padding-bottom: <?=$i/2 ?>em;
}

.JOH-P-<?=$key ?>PX
{
	padding: <?=$i*2 ?>px;
}

.JOH-P-<?=$key ?>EM
{
	padding: <?=$i/2 ?>em;
}
<?php } ?>

{{-- 色定義 --}}
<?php foreach ($colors as $color) { ?>
.JOH-Color-{{ str_replace('_', '', ucwords($color->category, '_')) }}-{{ $color->id }}
{
	{!! ($color->fore_color ? "color: {$color->fore_color};" : '') !!}
	{!! ($color->back_color ? "background-color: {$color->back_color};" : '') !!}
	{!! ($color->border_color ? "border-color: {$color->border_color};" : '') !!}
}
<?php } ?>

{{-- 要素の表示形式定義 --}}
.JOH-None
{
	display: none;
}

.JOH-Block
{
	display: block;
}

.JOH-Inline-Block
{
	display: inline-block;
}

.JOH-Inline
{
	display: inline-block;
}

.JOH-Flex
{
	display: flex;
}

{{-- 可視性の定義 --}}
.JOH-Visible
{
	visibility: visible;
}

.JOH-Invisible
{
	visibility: hidden;
}

{{-- 横方向に並べる。--}}
.JOH-Flex.Columns
{
	flex-direction: row;
}

.JOH-Flex.Columns-TL	{{-- 横方向＋左・上に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-start;
	align-content: flex-start;
}

.JOH-Flex.Columns-TC	{{-- 横方向＋中央・上に並べる。--}}
{
	flex-direction: row;
	justify-content: center;
	align-content: flex-start;
}

.JOH-Flex.Columns-TR	{{-- 横方向＋右・上に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-end;
	align-content: flex-start;
}

.JOH-Flex.Columns-TBetween	{{-- 横方向＋両端・上に並べる。--}}
{
	flex-direction: row;
	justify-content: space-between;
	align-content: flex-start;
}

.JOH-Flex.Columns-TAround	{{-- 横方向＋均等・上に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: flex-start;
}

.JOH-Flex.Columns-TEvenly	{{-- 横方向＋空白均等・上に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: flex-start;
}

.JOH-Flex.Columns-CL	{{-- 横方向＋左・中に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-start;
	align-content: center;
}

.JOH-Flex.Columns-CC	{{-- 横方向＋中央・中に並べる。--}}
{
	flex-direction: row;
	justify-content: center;
	align-content: center;
}

.JOH-Flex.Columns-CR	{{-- 横方向＋右・中に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-end;
	align-content: center;
}

.JOH-Flex.Columns-CBetween	{{-- 横方向＋両端・中に並べる。--}}
{
	flex-direction: row;
	justify-content: space-between;
	align-content: center;
}

.JOH-Flex.Columns-CAround	{{-- 横方向＋均等・中に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}

.JOH-Flex.Columns-CEvenly	{{-- 横方向＋空白均等・中に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}

.JOH-Flex.Columns-BL	{{-- 横方向＋左・下に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-start;
	align-content: center;
}

.JOH-Flex.Columns-BC	{{-- 横方向＋中央・下に並べる。--}}
{
	flex-direction: row;
	justify-content: center;
	align-content: center;
}

.JOH-Flex.Columns-BR	{{-- 横方向＋右・下に並べる。--}}
{
	flex-direction: row;
	justify-content: flex-end;
	align-content: center;
}

.JOH-Flex.Columns-BBetween	{{-- 横方向＋両端・下に並べる。--}}
{
	flex-direction: row;
	justify-content: space-between;
	align-content: center;
}

.JOH-Flex.Columns-BAround	{{-- 横方向＋均等・下に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}

.JOH-Flex.Columns-BEvenly	{{-- 横方向＋空白均等・下に並べる。--}}
{
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}

{{-- 縦方向に並べる --}}
.JOH-Flex.Rows
{
	flex-direction: column;
}

.JOH-Flex.Rows-TL	{{-- 縦方向＋左・上に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-start;
	align-content: flex-start;
}

.JOH-Flex.Rows-CL	{{-- 縦方向＋左・中に並べる。--}}
{
	flex-direction: column;
	justify-content: center;
	align-content: flex-start;
}

.JOH-Flex.Rows-BL	{{-- 縦方向＋左・下に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-end;
	align-content: flex-start;
}

.JOH-Flex.Rows-BetweenL	{{-- 縦方向＋左・上下両端に並べる。--}}
{
	flex-direction: column;
	justify-content: space-between;
	align-content: flex-start;
}

.JOH-Flex.Rows-AroundL	{{-- 縦方向＋左・上下均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-around;
	align-content: flex-start;
}

.JOH-Flex.Rows-EvenlyL	{{-- 縦方向＋左・上下空白均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-around;
	align-content: flex-start;
}


.JOH-Flex.Rows-TC	{{-- 縦方向＋中央・上に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-start;
	align-content: center;
}

.JOH-Flex.Rows-CC	{{-- 縦方向＋中央・中に並べる。--}}
{
	flex-direction: column;
	justify-content: center;
	align-content: center;
}

.JOH-Flex.Rows-BC	{{-- 縦方向＋中央・下に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-end;
	align-content: center;
}

.JOH-Flex.Rows-BetweenC	{{-- 縦方向＋中央・上下両端に並べる。--}}
{
	flex-direction: column;
	justify-content: space-between;
	align-content: center;
}

.JOH-Flex.Rows-AroundC	{{-- 縦方向＋中央・上下均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-around;
	align-content: center;
}

.JOH-Flex.Rows-EvenlyC	{{-- 縦方向＋中央・上下空白均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-evenly;
	align-content: center;
}


.JOH-Flex.Rows-TR	{{-- 縦方向＋右・中に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-start;
	align-content: flex-end;
}

.JOH-Flex.Rows-CR	{{-- 縦方向＋右・中に並べる。--}}
{
	flex-direction: column;
	justify-content: center;
	align-content: flex-end;
}

.JOH-Flex.Rows-BR	{{-- 縦方向＋右・中に並べる。--}}
{
	flex-direction: column;
	justify-content: flex-end;
	align-content: flex-end;
}

.JOH-Flex.Rows-BetweenR	{{-- 縦方向＋右・上下両端に並べる。--}}
{
	flex-direction: column;
	justify-content: space-between;
	align-content: flex-end;
}

.JOH-Flex.Rows-AroundR	{{-- 縦方向＋右・上下均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-around;
	align-content: flex-end;
}

.JOH-Flex.Rows-EvenlyR	{{-- 縦方向＋右・上下空白均等に並べる。--}}
{
	flex-direction: column;
	justify-content: space-evenly;
	align-content: flex-end;
}

{{-- フォントサイズ定義 --}}
.JOH-Font-XL
{
	font-size: 2rem;
}

.JOH-Font-LL
{
	font-size: 1.5rem;
}

.JOH-Font-L
{
	font-size: 1.2rem;
}

.JOH-Font-M
{
	font-size: 1.1rem;
}

.JOH-Font-S
{
	font-size: 0.9rem;
}

.JOH-Font-SS
{
	font-size: 0.7rem;
}

.JOH-Font-XS
{
	font-size: 0.5rem;
}

{{-- 行高さ定義 --}}
.JOH-LineH-XL
{
	line-height: 2.1rem;
}

.JOH-LineH-LL
{
	line-height: 1.6rem;
}

.JOH-LineH-L
{
	line-height: 1.3rem;
}

.JOH-LineH-M
{
	line-height: 1.2rem;
}

.JOH-LineH-S
{
	line-height: 1rem;
}

.JOH-LineH-SS
{
	line-height: 0.8rem;
}

.JOH-LineH-XS
{
	line-height: 0.6rem;
}

{{-- 文字装飾 --}}
.JOH-Font-Normal
{
	font-weight: normal;
	text-decoration: none;
}

.JOH-Font-Weight-Normal
{
	font-weight: normal;
}

.JOH-Font-Weight-Bold
{
	font-weight: bold;
}

.JOH-Font-Underline
{
	text-decoration: underline;
}

.JOH-Font-Overline
{
	text-decoration: overline;
}

.JOH-Font-Cancel
{
	text-decoration: overline;
}

.JOH-Font-Blink
{
	text-decoration: blink;
}

{{-- インライン位置定義 --}}
.JOH-IPos-Left
{
	text-align: left;
}

.JOH-IPos-Center
{
	text-align: center;
}

.JOH-IPos-Right
{
	text-align: right;
}

{{-- サイズ定義 --}}
.JOH-W-Full
{
	width: 100%;
}

.JOH-W-Half
{
	width: 50%;
}

.JOH-W-QHalf
{
	width: 25%;
}

<?php foreach ([ 1,2,3,4,5,6,7,8,9,10,12,14,16,18,20,25,30,40,50 ] as $em) { ?>
.JOH-W-<?=$em ?>EM
{
	width: <?=$em ?>em;
	min-width: <?=$em ?>em;
	max-width: <?=$em ?>em;
}
.JOH-MinW-<?=$em ?>EM
{
	min-width: <?=$em ?>em;
}
.JOH-MaxW-<?=$em ?>EM
{
	max-width: <?=$em ?>em;
}

.JOH-H-<?=$em ?>EM
{
	height: <?=$em ?>em;
	min-height: <?=$em ?>em;
	max-height: <?=$em ?>em;
}
.JOH-MinH-<?=$em ?>EM
{
	min-height: <?=$em ?>em;
}
.JOH-MaxH-<?=$em ?>EM
{
	max-height: <?=$em ?>em;
}
<?php } ?>

<?php for ($i=0; $i<24; $i++) { ?>
.JOH-W24-<?=($i+1) ?>
{
	width: <?=(1/24*($i+1)*100) ?>%;
}
<?php } ?>

<?php for ($i=0; $i<12; $i++) { ?>
.JOH-W12-<?=($i+1) ?>
{
	width: <?=(1/12*($i+1)*100) ?>%;
}
<?php } ?>

.JOH-H-Full
{
	height: 100%;
}

.JOH-H-Half
{
	height: 50%;
}

.JOH-H-QHalf
{
	height: 25%;
}

{{-- 角処理の定義 --}}
.JOH-Radius-None
{
	border-radius: 0px;
}

.JOH-Radius-All
{
	border-radius: 6px;
}

.JOH-Radius-Top
{
	border-radius: 6px 6px 0px 0px;
}

.JOH-Radius-Bottom
{
	border-radius: 0px 0px 6px 6px;
}

.JOH-Radius-Left
{
	border-radius: 6px 0px 0px 6px;
}

.JOH-Radius-Right
{
	border-radius: 0px 6px 6px 0px;
}

{{-- ボーダー定義 --}}
.JOH-Border-None
{
	border-width: 0px;
	border-style: none;
}

<?php for ($i=1; $i<=10; $i++) { ?>
.JOH-Border-<?=$i ?>
{
	border-width: <?=$i ?>px;
	border-style: solid;
}

.JOH-Border-Top-<?=$i ?>
{
	border-top-width: <?=$i ?>px;
	border-top-style: solid;
}

.JOH-Border-Bottom-<?=$i ?>
{
	border-bottom-width: <?=$i ?>px;
	border-bottom-style: solid;
}

.JOH-Border-Left-<?=$i ?>
{
	border-left-width: <?=$i ?>px;
	border-left-style: solid;
}

.JOH-Border-Right-<?=$i ?>
{
	border-right-width: <?=$i ?>px;
	border-right-style: solid;
}
<?php } ?>

{{-- 分割線あり --}}
.JOH-Separated > *
{
    border-right: 1px solid {!! $color_palette['Border-Separated']->border_color !!};
}

.JOH-Separated > *:last-child
{
    border-right: 0px none transparent;
}

{{-- 自動改行の設定 --}}
.JOH-Wrap-Manual
{
	white-space: nowrap;
	word-break: keep-all;
}

.JOH-Wrap-Auto
{
	white-space: normal;
	word-break: break-all;
}

