<?php
namespace App\Helpers;

class ViewHelper {
    public static function attr($name, $value) {
        if ($value) {
            return " {$name}=\"{$value}\"";
        }
    }

    public static function tag($tag_name, array $attrs=[], $inner=null) {
        $attr_list = [];
        if ($attrs) {
            foreach ($attrs as $attr_name => $attr_value) {
                if (is_array($attr_value)) {
                    $attr_list[] = sprintf('%s="%s"', $attr_name, implode(' ', $attr_value));
                }
                else if (is_string($attr_value)) {
                    $attr_list[] = sprintf('%s="%s"', $attr_name, $attr_value);
                }
                else if (is_numeric($attr_value)) {
                    $attr_list[] = sprintf('%s="%s"', $attr_name, strval($attr_value));
                }
                else if (is_bool($attr_value) && $attr_value===true) {
                    $attr_list[] = $attr_name;
                }
            }
        }

        if ($inner === null) {
            return '<' . $tag_name . (!$attr_list ? '' : ' ' . implode(' ', $attr_list)) . '>';
        }
        else if ($inner === '') {
            return '<' . $tag_name . (!$attr_list ? '' : ' ' . implode(' ', $attr_list)) . '></' . $tag_name . '>';
        }
        else {
            return '<' . $tag_name . (!$attr_list ? '' : ' ' . implode(' ', $attr_list)) . '>' . $inner . '</' . $tag_name . '>';
        }
    }
}