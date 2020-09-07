(window.webpackJsonp=window.webpackJsonp||[]).push([[15],{72:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return c})),n.d(t,"metadata",(function(){return o})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return b}));var r=n(2),a=n(6),i=(n(0),n(85)),c={id:"Screens"},o={unversionedId:"Screens",id:"Screens",isDocsHomePage:!1,title:"Screens",description:"When Jard attaches at any line of code, the main tile-style UI shows up. By default, there are 5 areas on the UI that you'll be interested.",source:"@site/docs/screens.md",slug:"/Screens",permalink:"/docs/Screens",editUrl:"https://github.com/nguyenquangminh0711/ruby_jard/edit/master/website/docs/screens.md",version:"current",sidebar:"docs",previous:{title:"Installation",permalink:"/docs/Installation"},next:{title:"Color schemes",permalink:"/docs/Color schemes"}},l=[{value:"Source screen",id:"source-screen",children:[]},{value:"Backtrace screen",id:"backtrace-screen",children:[]},{value:"Variable screen",id:"variable-screen",children:[]},{value:"Thread screen",id:"thread-screen",children:[]},{value:"Repl screen",id:"repl-screen",children:[]}],s={rightToc:l};function b(e){var t=e.components,n=Object(a.a)(e,["components"]);return Object(i.b)("wrapper",Object(r.a)({},s,n,{components:t,mdxType:"MDXLayout"}),Object(i.b)("p",null,"When Jard attaches at any line of code, the main tile-style UI shows up. By default, there are 5 areas on the UI that you'll be interested."),Object(i.b)("h3",{id:"source-screen"},"Source screen"),Object(i.b)("img",{src:"/img/screen-source.png",alt:"Source screen"}),Object(i.b)("p",null,"This screen shows the current line of code that your program is stopping, and surrounding related lines. The number of lines shown in this screen depends on your current terminal height, but never less than 5."),Object(i.b)("p",null,"Ruby Jard supports any file extensions that your program runs into, especially ",Object(i.b)("inlineCode",{parentName:"p"},".rb"),", ",Object(i.b)("inlineCode",{parentName:"p"},".erb"),", ",Object(i.b)("inlineCode",{parentName:"p"},".haml")," files. Other file types may encounter minor syntax highlighting issues."),Object(i.b)("p",null,"Ruby Jard also supports inspecting gems and libraries, if you are interested."),Object(i.b)("h3",{id:"backtrace-screen"},"Backtrace screen"),Object(i.b)("img",{src:"/img/screen-backtrace.png",alt:"Screen backtrace"}),Object(i.b)("p",null,"This screen describes the current backtrace of the current thread your program is stopping. Each line of this screen describes the current Frame. What is frame and backtrace by the way? Let's step back a little bit at how Ruby executes your code. Internally, Ruby uses an interpreter to read and execute your code, line by line (technically, YARD instructions, but let's go with a simple version). When it meets a chunk of code that needs to open a new scope, like method calls or inline-block call, the interpreter creates a new structure to store the current context so that it can link to the next scope and go back later. This data structure is call Frame. The interpreter pushes frame into a stack, called backtrace (or stack trace, or call stack, whatever), and continues to execute your code. Each thread has a separate backtrace. To understand deeply, you may be interested in this wonderful slide: ",Object(i.b)("a",Object(r.a)({parentName:"p"},{href:"https://www.slideshare.net/KeitaSugiyama1/grow-and-shrink-dynamically-extending-the-ruby-vm-stack"}),"Grow and Shrink - Dynamically Extending the Ruby VM Stack"),"."),Object(i.b)("p",null,"Overall, the whole backtrace screen lets you know where you are stopping at, the trace of how your program is running. When combining with other tools and other screens, you will be surprised by how much information the bugger can help you when you encounter your bugs."),Object(i.b)("p",null,"Each frame includes the following information:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},"Frame ID: incremental, can be used to jump to an arbitrary frame with frame command."),Object(i.b)("li",{parentName:"ul"},"Current location label: a class name and method name of the method covers its frame. If there is a ",Object(i.b)("inlineCode",{parentName:"li"},"[c]")," prefix in front of a class name, it means that the method is provided by Ruby, implemented in C, and impossible to peek."),Object(i.b)("li",{parentName:"ul"},"Current physical location: exact file name and line number. If a frame is allocated in a gem, the physical location shows a gem name and version only. For example: ",Object(i.b)("inlineCode",{parentName:"li"},"RSpec::Core::Hooks::HookCollections in run in rspec-core (3.9.2)"),".")),Object(i.b)("h3",{id:"variable-screen"},"Variable screen"),Object(i.b)("img",{src:"/img/screen-variables.png",alt:"Variables screen"}),Object(i.b)("p",null,"The variable screen lets you explore all the local variables, instance variables, and constants in the current display context. Each variable is described by:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},"Inline indicator: the beginning dot (",Object(i.b)("inlineCode",{parentName:"li"},"\u2022"),") implies a variable that appears in the current line."),Object(i.b)("li",{parentName:"ul"},"Variable type: allow you to know the type of a variable at a single glance. Only built-in types, such as ",Object(i.b)("inlineCode",{parentName:"li"},"int"),", ",Object(i.b)("inlineCode",{parentName:"li"},"flt"),", ",Object(i.b)("inlineCode",{parentName:"li"},"hash"),", ",Object(i.b)("inlineCode",{parentName:"li"},"bool"),", ",Object(i.b)("inlineCode",{parentName:"li"},"rng"),", are supported. Instances of any classes will be noted as ",Object(i.b)("inlineCode",{parentName:"li"},"var"),"."),Object(i.b)("li",{parentName:"ul"},"Size of variable: the size of collection-like variables. Current Jard version supports 3 types:",Object(i.b)("ul",{parentName:"li"},Object(i.b)("li",{parentName:"ul"},"Hash: this field shows the number of keys"),Object(i.b)("li",{parentName:"ul"},"Array: this field shows the number of items"),Object(i.b)("li",{parentName:"ul"},"String: this field shows the number of character (fetched from",Object(i.b)("inlineCode",{parentName:"li"},"String#size")," method)"))),Object(i.b)("li",{parentName:"ul"},"Variable inspection: the content of the variable. The current Jard version generates this field by calling ",Object(i.b)("inlineCode",{parentName:"li"},"#inspect"),". ",Object(i.b)("strong",{parentName:"li"},"Known issue"),": this accidentally triggers materializing method of objects, such as ",Object(i.b)("inlineCode",{parentName:"li"},"ActiveRecord::Relation"),". Future Jard version gonna fix this by a new safe generator.")),Object(i.b)("p",null,"This screen interacts well with backtrace screen and backtrace-exploring commands such as (",Object(i.b)("inlineCode",{parentName:"p"},"up"),", ",Object(i.b)("inlineCode",{parentName:"p"},"down"),", ",Object(i.b)("inlineCode",{parentName:"p"},"frame"),", etc.) to inspect relative variables at each frame layer in the program. A common use case is to recall the parameter values you forgot when digging too deep into a method call."),Object(i.b)("p",null,"By default, the variables are sorted by the following criteria:"),Object(i.b)("ul",null,Object(i.b)("li",{parentName:"ul"},"Pinned variables (coming soon)"),Object(i.b)("li",{parentName:"ul"},"Current context (self)"),Object(i.b)("li",{parentName:"ul"},"Local variables"),Object(i.b)("li",{parentName:"ul"},"Instance variables"),Object(i.b)("li",{parentName:"ul"},"Constants"),Object(i.b)("li",{parentName:"ul"},"Global variables (coming soon)")),Object(i.b)("h3",{id:"thread-screen"},"Thread screen"),Object(i.b)("img",{src:"/img/screen-threads.png",alt:"Screen threads"}),Object(i.b)("p",null,"Show all the threads running at the moment. This screen is useful when you are working with a complicated multi-threaded environment like web server, or background jobs."),Object(i.b)("h3",{id:"repl-screen"},"Repl screen"),Object(i.b)("img",{src:"/img/screen-repl.png",alt:"Screen repl"}),Object(i.b)("p",null,"An interactive Repl for you to interact with your program, inspect values, update values, or control the debug flow as you want. The heart of Jard's repl is ",Object(i.b)("a",Object(r.a)({parentName:"p"},{href:"https://github.com/pry/pry"}),"Pry"),", a masterpiece gem. When you type a command, Jard parses, and does corresponding actions if what you type matches supported command. Otherwise, they are evaluated as Ruby code."))}b.isMDXComponent=!0},85:function(e,t,n){"use strict";n.d(t,"a",(function(){return u})),n.d(t,"b",(function(){return h}));var r=n(0),a=n.n(r);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function c(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?c(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):c(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},i=Object.keys(e);for(r=0;r<i.length;r++)n=i[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(r=0;r<i.length;r++)n=i[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var s=a.a.createContext({}),b=function(e){var t=a.a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},u=function(e){var t=b(e.components);return a.a.createElement(s.Provider,{value:t},e.children)},p={inlineCode:"code",wrapper:function(e){var t=e.children;return a.a.createElement(a.a.Fragment,{},t)}},d=a.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,i=e.originalType,c=e.parentName,s=l(e,["components","mdxType","originalType","parentName"]),u=b(n),d=r,h=u["".concat(c,".").concat(d)]||u[d]||p[d]||i;return n?a.a.createElement(h,o(o({ref:t},s),{},{components:n})):a.a.createElement(h,o({ref:t},s))}));function h(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var i=n.length,c=new Array(i);c[0]=d;var o={};for(var l in t)hasOwnProperty.call(t,l)&&(o[l]=t[l]);o.originalType=e,o.mdxType="string"==typeof e?e:r,c[1]=o;for(var s=2;s<i;s++)c[s]=n[s];return a.a.createElement.apply(null,c)}return a.a.createElement.apply(null,n)}d.displayName="MDXCreateElement"}}]);