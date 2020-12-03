(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{56:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return o})),n.d(t,"metadata",(function(){return b})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return d}));var a=n(2),r=n(6),i=(n(0),n(93)),c=n(97),o={id:"Key bindings",slug:"key-bindings"},b={unversionedId:"guides/Key bindings",id:"guides/Key bindings",isDocsHomePage:!1,title:"Key bindings",description:"| Key Binding | Meaning | Equivalent command |",source:"@site/docs/guides/key_bindings.md",slug:"/guides/key-bindings",permalink:"/docs/guides/key-bindings",editUrl:"https://github.com/nguyenquangminh0711/ruby_jard/edit/master/website/docs/guides/key_bindings.md",version:"current",sidebar:"docs",previous:{title:"Filter",permalink:"/docs/guides/filter"},next:{title:"Color schemes",permalink:"/docs/guides/color-schemes"}},l=[],u={rightToc:l};function d(e){var t=e.components,n=Object(r.a)(e,["components"]);return Object(i.b)("wrapper",Object(a.a)({},u,n,{components:t,mdxType:"MDXLayout"}),Object(i.b)("table",null,Object(i.b)("thead",{parentName:"table"},Object(i.b)("tr",{parentName:"thead"},Object(i.b)("th",Object(a.a)({parentName:"tr"},{align:null}),"Key Binding"),Object(i.b)("th",Object(a.a)({parentName:"tr"},{align:null}),"Meaning"),Object(i.b)("th",Object(a.a)({parentName:"tr"},{align:null}),"Equivalent command"))),Object(i.b)("tbody",{parentName:"table"},Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F2"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Switch ",Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/guides/filter"}),"filter")," mode"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/filter"}),"filter"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F5"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Refresh the interface"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/list"}),"list"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F6"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Move to parent frame in the backtrace"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/up"}),"up"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Shift F6"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Move to child frame in the backtrace"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/down"}),"down"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F7"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Detect and step into a method call or block on the current line"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/step"}),"step"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Shift F7"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Finish execution of the current frame and jump to the next line of the parent frame"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/step-out"}),"step-out"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F8"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Move to the next line"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/next"}),"next"))),Object(i.b)("tr",{parentName:"tbody"},Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"F9, Ctrl+D"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),"Continue the execution of your program until exit, or stop at the next break point"),Object(i.b)("td",Object(a.a)({parentName:"tr"},{align:null}),Object(i.b)("a",Object(a.a)({parentName:"td"},{href:"/docs/commands/continue"}),"continue"))))),Object(i.b)("p",null,"You can always customize the key bindings set by putting a simple setting in the ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"/docs/guides/configurations"}),"configuration file"),". The list of natively supported key binding is defined in ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"https://github.com/nguyenquangminh0711/ruby_jard/blob/master/lib/ruby_jard/keys.rb"}),"this file"),"."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{className:"language-ruby"}),"config.key_bindings = {\n  RubyJard::Keys::CTRL_N        => 'jard filter switch',\n  RubyJard::Keys::META_L        => 'list',\n  RubyJard::Keys::CTRL_F1       => 'up',\n  RubyJard::Keys::CTRL_SHIFT_F1 => 'down',\n  RubyJard::Keys::META_D        => 'step',\n  RubyJard::Keys::META_O        => 'step-out',\n  RubyJard::Keys::CTRL_META_N   => 'next',\n  RubyJard::Keys::META_F1       => 'continue',\n  RubyJard::Keys::META_SHIFT_F1 => 'continue',\n  RubyJard::Keys::CTRL_C        => 'interrupt'\n}\n")),Object(i.b)("p",null,"Jard also supports non-traditional and machine-dependent key bindings. For example, to map the ",Object(i.b)("inlineCode",{parentName:"p"},"Ctrl+Home")," key combination to the ",Object(i.b)("inlineCode",{parentName:"p"},"next")," command, you first need to get the code sequences of this combination. Let's run the following ruby program inside your terminal, press ",Object(i.b)("inlineCode",{parentName:"p"},"Ctrl+Home"),", copy the output, then put it into the configuration file."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{className:"language-ruby"}),"require 'io/console'\n\nSTDOUT.raw!\nbegin\n  loop do\n    begin\n      data = STDIN.read_nonblock(255)\n      exit if data == \"\\u0003\"\n      print data.inspect\n    rescue IO::WaitReadable; sleep 0.1; end\n  end\nensure\n  STDOUT.cooked!\nend\n")),Object(i.b)(c.a,{link:"/img/guides/key-bindings.png",alt:"Capture raw key sequences",mdxType:"LinkedImage"}),Object(i.b)("p",null,"In my machine, the above program prints ",Object(i.b)("inlineCode",{parentName:"p"},'"\\e[1;5H"'),". My configuration to map ",Object(i.b)("inlineCode",{parentName:"p"},"Ctrl+Home")," to ",Object(i.b)("inlineCode",{parentName:"p"},"next")," command looks like this:"),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{className:"language-ruby"}),"config.key_bindings = {\n  \"\\e[1;5H\" => 'next'\n}\n")),Object(i.b)("p",null,"If the above program doesn't print any output, it means the key combination is conflicted or already handled by some programs in your environment. Please pick another one."))}d.isMDXComponent=!0},93:function(e,t,n){"use strict";n.d(t,"a",(function(){return d})),n.d(t,"b",(function(){return m}));var a=n(0),r=n.n(a);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function c(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?c(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):c(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function b(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},i=Object.keys(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var l=r.a.createContext({}),u=function(e){var t=r.a.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},d=function(e){var t=u(e.components);return r.a.createElement(l.Provider,{value:t},e.children)},s={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},p=r.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,i=e.originalType,c=e.parentName,l=b(e,["components","mdxType","originalType","parentName"]),d=u(n),p=a,m=d["".concat(c,".").concat(p)]||d[p]||s[p]||i;return n?r.a.createElement(m,o(o({ref:t},l),{},{components:n})):r.a.createElement(m,o({ref:t},l))}));function m(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var i=n.length,c=new Array(i);c[0]=p;var o={};for(var b in t)hasOwnProperty.call(t,b)&&(o[b]=t[b]);o.originalType=e,o.mdxType="string"==typeof e?e:a,c[1]=o;for(var l=2;l<i;l++)c[l]=n[l];return r.a.createElement.apply(null,c)}return r.a.createElement.apply(null,n)}p.displayName="MDXCreateElement"},94:function(e,t,n){"use strict";var a=n(0),r=n(19);t.a=function(){var e=Object(a.useContext)(r.a);if(null===e)throw new Error("Docusaurus context not provided");return e}},95:function(e,t,n){"use strict";n.d(t,"b",(function(){return i})),n.d(t,"a",(function(){return c}));var a=n(94),r=n(96);function i(){var e=Object(a.a)().siteConfig,t=(e=void 0===e?{}:e).baseUrl,n=void 0===t?"/":t,i=e.url;return{withBaseUrl:function(e,t){return function(e,t,n,a){var i=void 0===a?{}:a,c=i.forcePrependBaseUrl,o=void 0!==c&&c,b=i.absolute,l=void 0!==b&&b;if(!n)return n;if(n.startsWith("#"))return n;if(Object(r.b)(n))return n;if(o)return t+n;var u=!n.startsWith(t)?t+n.replace(/^\//,""):n;return l?e+u:u}(i,n,e,t)}}}function c(e,t){return void 0===t&&(t={}),(0,i().withBaseUrl)(e,t)}},96:function(e,t,n){"use strict";function a(e){return!0===/^(\w*:|\/\/)/.test(e)}function r(e){return void 0!==e&&!a(e)}n.d(t,"b",(function(){return a})),n.d(t,"a",(function(){return r}))},97:function(e,t,n){"use strict";n.d(t,"a",(function(){return c}));var a=n(0),r=n.n(a),i=n(95),c=function(e){var t=e.link,n=e.alt;return r.a.createElement(r.a.Fragment,null,r.a.createElement("a",{target:"_blank",href:Object(i.a)(t),style:{display:"block"}},r.a.createElement("div",{style:{lineHeight:0,display:"inline-block"}},r.a.createElement("img",{alt:n,src:Object(i.a)(t),style:{borderRadius:"7px"}}),r.a.createElement("div",{className:"alert alert--secondary",style:{padding:"1.5rem"}},n,". Click to enlarge."))),r.a.createElement("br",null))}}}]);