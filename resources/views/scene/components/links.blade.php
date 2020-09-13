<?php
/**
 * 属性：
 * *string id … 当コンポーネントの識別ID
 * *string link_id … リンクID
 *  bool certified … 認証状態
 *  class … 各タグに設定するclass属性　※下記のキーを設定可能
 *    dl
 *    dl/dd
 *    dl/dd/span
 *    dl/dd/a
 *  style … 各タグに設定するstyle属性　※下記のキーを設定可能
 *    dl
 *    dl/dd
 *    dl/dd/span
 *    dl/dd/a
 */

use App\Models\LinkItem;
use App\Helpers\ViewHelper;

$link_items = LinkItem::rowsetByLinkId($link_id, (@$certified ?: false));
?>
<dl id="{!! $id !!}" data-id="{!! $id !!}" data-behavior-type="JOH.components.Links"{!! ViewHelper::attr('class', @$class['dl']) !!}{!! ViewHelper::attr('style', @$style['dl']) !!}><?php foreach ($link_items as $link_item) { ?>
<dd{!! ViewHelper::attr('class', @$class['dl/dd']) !!}{!! ViewHelper::attr('style', @$style['dl/dd']) !!}><?php
if ($link_item->link_item_type==0) { echo '<span data-link-item-type="' . $link_item->link_item_type . '" ' . ViewHelper::attr('class', @$class['dl/dd/span']) . ViewHelper::attr('style', @$style['dl/dd/span'])  . '>' . $link_item->name .'</span>'; }
else if ($link_item->link_item_type==1) { echo '<a data-link-item-type="' . $link_item->link_item_type . '" href="' . ($link_item->url ?: '#') . '" ' . ViewHelper::attr('class', @$class['dl/dd/a']) . ViewHelper::attr('style', @$style['dl/dd/a']) . '>' . $link_item->name .'</a>'; }
else if (in_array($link_item->link_item_type, [2,3])) { echo '<a data-link-item-type="' . $link_item->link_item_type . '" data-link-item-value="' . $link_item->link_item_value . '" data-url="' . $link_item->url . '" href="#"' . ViewHelper::attr('class', @$class['dl/dd/a']) . ViewHelper::attr('style', @$style['dl/dd/a']) . '>' . $link_item->name .'</a>'; }
else if ($link_item->link_item_type==9) { echo '<span  data-link-item-type="' . $link_item->link_item_type . '"' . ViewHelper::attr('class', @$class['dl/dd/span']) . ViewHelper::attr('style', @$style['dl/dd/span']) . '>&nbsp;</span>'; }
?></dd>
<?php } ?></dl>
