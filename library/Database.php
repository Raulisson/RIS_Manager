<?php

    class Database {

        public static $DB_USER = 'corpmng';
        public static $DB_PASS = 'corpmng2020';
        public static $DB_NAME = 'corpmng';

        /**
         * Cria uma conexão
         */
        public static function getConn($discovery = false) {
            require_once("../library/NotORM/NotORM.php");
            $pdo = new PDO("mysql:dbname=".self::$DB_NAME, self::$DB_USER, self::$DB_PASS, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
            if( $discovery ) {
                $db = new NotORM($pdo, new NotORM_Structure_Discovery($pdo));
            } else {
                $db = new NotORM($pdo);
            }
            return $db;
        }

        /**
         * Executa uma query nativa
         */
        public static function query($sql) {
            $pdo = new PDO("mysql:dbname=".self::$DB_NAME, self::$DB_USER, self::$DB_PASS, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
            $res = $pdo->query($sql, PDO::FETCH_ASSOC);
            $itens = [];
            foreach( $res as $item ) {
                $itens[] = $item;
            }
            return $itens;
        }
    }

?>