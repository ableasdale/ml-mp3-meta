xquery version "1.0-ml";

import module namespace common = "http://www.example.com/common" at "/lib/common.xqy";

declare namespace xhtml = "http://www.w3.org/1999/xhtml";

declare function local:escape-for-regex( $arg as xs:string? ) as xs:string {
    replace($arg, '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')
};

declare function local:substring-after-last($arg as xs:string?, $delim as xs:string) as xs:string {
    replace($arg,concat('^.*',local:escape-for-regex($delim)),'')
};

common:build-page(<div id="content">
    <ul>
        {for $x in doc()
        return 
        element li {element a {attribute href {concat("/view.xqy?uri=",fn:encode-for-uri(xdmp:node-uri($x)))}, local:substring-after-last(xdmp:node-uri($x), "/")}}}
    </ul>
</div>)