xquery version "1.0-ml";

import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";
import module namespace info = "http://marklogic.com/appservices/infostudio"  at "/MarkLogic/appservices/infostudio/info.xqy";

declare variable $FOREST_MOUNTPOINT as xs:string := "E:\"; 
declare variable $CONFIG := admin:get-configuration();
declare variable $DATABASE-NAME as xs:string := "Mp3";
(: declare variable $APPSERVER-NAME as xs:string := "enron-http-rest"; :)
declare variable $HTTP-SERVER-PORT := 8004;

(: 1. create db 
info:database-create($DATABASE-NAME, 1, "Default", $FOREST_MOUNTPOINT, "Security", "Schemas", "Triggers") :)

(: 2. create app server to POST to http-8004-mp3 :)


(: Main :)
(
    info:database-create($DATABASE-NAME, 1, "Default", $FOREST_MOUNTPOINT, "Security", "Schemas", "Triggers")
)