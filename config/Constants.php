<?php

    // Perfis
    //define('PESSOA_JURIDICA',      	1);
    
    class Constants {
        static function getLabel($grp, $val) {
            $consts = get_defined_constants();
            foreach( $consts as $k => $const ) {
                if( strpos($k, $grp) !== false && $const == $val ) {
                    $kLabel = "{$k}_LABEL";
                    return constant($kLabel);
                }
            }
            return "";
        }
        static function getList($grp) {
            $consts = get_defined_constants();
            $list = [];
            foreach( $consts as $k => $const ) {
                if( strpos($k, $grp) !== false && strpos($k, '_LABEL' ) === false ) {
                    $list[$const] = constant($k . '_LABEL');
                }
            }
            return $list;
        }
    }

?>