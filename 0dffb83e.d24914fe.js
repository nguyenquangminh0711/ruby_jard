(window.webpackJsonp=window.webpackJsonp||[]).push([[3],{53:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return l})),n.d(t,"rightToc",(function(){return s})),n.d(t,"default",(function(){return u}));var r=n(2),o=n(6),a=(n(0),n(85)),i={id:"Roadmap"},l={unversionedId:"Roadmap",id:"Roadmap",isDocsHomePage:!1,title:"Roadmap",description:"[Done] Version 0.1.0: Proof of concept",source:"@site/docs/roadmap.md",slug:"/Roadmap",permalink:"/docs/Roadmap",editUrl:"https://github.com/nguyenquangminh0711/ruby_jard/edit/master/website/docs/roadmap.md",version:"current",sidebar:"docs",previous:{title:"Contributing",permalink:"/docs/Contributing"},next:{title:"Installation",permalink:"/docs/Installation"}},s=[{value:"Done Version 0.1.0: Proof of concept",id:"done-version-010-proof-of-concept",children:[]},{value:"Done Version 0.2.0: UI completeness",id:"done-version-020-ui-completeness",children:[]},{value:"Version 0.3.0: Complete the workflow",id:"version-030-complete-the-workflow",children:[]},{value:"Version 0.4.0: User satisfaction",id:"version-040-user-satisfaction",children:[]},{value:"Version 0.5.0: Integration",id:"version-050-integration",children:[]},{value:"Further future",id:"further-future",children:[]}],c={rightToc:s};function u(e){var t=e.components,n=Object(o.a)(e,["components"]);return Object(a.b)("wrapper",Object(r.a)({},c,n,{components:t,mdxType:"MDXLayout"}),Object(a.b)("h3",{id:"done-version-010-proof-of-concept"},"[Done]"," Version 0.1.0: Proof of concept"),Object(a.b)("p",null,"This version is a bootstrap to see whether my idea works or not, in term of technical possibility and user usability. Luckily, everything works now, and I receive possible feedback from friends and peers."),Object(a.b)("h3",{id:"done-version-020-ui-completeness"},"[Done]"," Version 0.2.0: UI completeness"),Object(a.b)("p",null,"The bootstrap version is just a series of ugly prints on stdout. It's frustrated as many things can be broken, wrong drawing, text overlapping, etc. This version is to fix those issues, and provide a foundation for more complicated drawing."),Object(a.b)("h3",{id:"version-030-complete-the-workflow"},"Version 0.3.0: Complete the workflow"),Object(a.b)("p",null,"This version focuses on making Jard usable for daily activities of any developer. In other words, this version is to become a complete replacement for Byebug (sorry \ud83d\ude4f)."),Object(a.b)("ul",null,Object(a.b)("li",{parentName:"ul"},"Manage program's STDOUT."),Object(a.b)("li",{parentName:"ul"},"Fulfill options for existing commands."),Object(a.b)("li",{parentName:"ul"},"Add more commands to control workflow."),Object(a.b)("li",{parentName:"ul"},"etc.")),Object(a.b)("h3",{id:"version-040-user-satisfaction"},"Version 0.4.0: User satisfaction"),Object(a.b)("p",null,'Ruby Jard now serves well for all debugging use case. But it becomes floated, hard to use, and maybe just not "click" for the user. This version focuses on improve userability, stability, bugs, tweak small details. So that, after this version, Ruby Jard is just pleasant to use.'),Object(a.b)("ul",null,Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Support different screen sizes.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Minimal layout configuration.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Allow customizations (keyboard shortcut for example).")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Rebuild variable inspection to optimize for each data type, especially nested complicated structure.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Collapsible and expandale variable inspection.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Windows, viewport, scrolling, etc.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Navigate between panels.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Build a buffer system to reduce interaction with STDOUT, and eventually improve drawing latency.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Dynamic breakpoints.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Watch expressions.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Pin variables.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Post moterm.")),Object(a.b)("li",{parentName:"ul"},Object(a.b)("p",{parentName:"li"},"Trace variable changes."))),Object(a.b)("h3",{id:"version-050-integration"},"Version 0.5.0: Integration"),Object(a.b)("p",null,"Accept or not, not everyone uses vim, or even terminal. Even in the terminal, I just want to provide minimal layout customizations, as I don't want to rebuild Tmux. Therefore, integration with other powerful systems to extend use cases, adapt different work flow and preferences is the focus on this version. I'm not sure about the ultimate solution, but at my limited knowledge now, ",Object(a.b)("a",Object(r.a)({parentName:"p"},{href:"https://microsoft.github.io/debug-adapter-protocol/"}),"Debugger Adapter Protocol")," looks promising."),Object(a.b)("ul",null,Object(a.b)("li",{parentName:"ul"},"Prepare the infrastructure for DAP protocol."),Object(a.b)("li",{parentName:"ul"},"Separate and split the panels into possible isolated processes, connect them together with DAP."),Object(a.b)("li",{parentName:"ul"},"Fully layout configurations and integrate with Tmux."),Object(a.b)("li",{parentName:"ul"},"Integrate with Vim 8+/Neovim via Terminal mode."),Object(a.b)("li",{parentName:"ul"},"Integrate with Visual Studio Code via DAP."),Object(a.b)("li",{parentName:"ul"},"Integrate with Emacs via dap mode."),Object(a.b)("li",{parentName:"ul"},"Encrypted remote debugging.")),Object(a.b)("h3",{id:"further-future"},"Further future"),Object(a.b)("p",null,"I won't stop until 0.5.0 version, even Jard doesn't have any users. However, as soon as it reaches 0.5.0, and serves my interest well, I don't have much things in mind now. The future is uncertain. Dreaming is good. Making dreams come true is hard, and time-consuming. Hope I can reach that future."))}u.isMDXComponent=!0},85:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return d}));var r=n(0),o=n.n(r);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,r,o=function(e,t){if(null==e)return{};var n,r,o={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(o[n]=e[n]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(o[n]=e[n])}return o}var c=o.a.createContext({}),u=function(e){var t=o.a.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},p=function(e){var t=u(e.components);return o.a.createElement(c.Provider,{value:t},e.children)},b={inlineCode:"code",wrapper:function(e){var t=e.children;return o.a.createElement(o.a.Fragment,{},t)}},m=o.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,a=e.originalType,i=e.parentName,c=s(e,["components","mdxType","originalType","parentName"]),p=u(n),m=r,d=p["".concat(i,".").concat(m)]||p[m]||b[m]||a;return n?o.a.createElement(d,l(l({ref:t},c),{},{components:n})):o.a.createElement(d,l({ref:t},c))}));function d(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var a=n.length,i=new Array(a);i[0]=m;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l.mdxType="string"==typeof e?e:r,i[1]=l;for(var c=2;c<a;c++)i[c]=n[c];return o.a.createElement.apply(null,i)}return o.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"}}]);