﻿/*
 Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or https://ckeditor.com/legal/ckeditor-oss-license
*/
CKEDITOR.plugins.add("forms",{requires:"dialog,fakeobjects",lang:"af,ar,az,bg,bn,bs,ca,cs,cy,da,de,de-ch,el,en,en-au,en-ca,en-gb,eo,es,es-mx,et,eu,fa,fi,fo,fr,fr-ca,gl,gu,he,hi,hr,hu,id,is,it,ja,ka,km,ko,ku,lt,lv,mk,mn,ms,nb,nl,no,oc,pl,pt,pt-br,ro,ru,si,sk,sl,sq,sr,sr-latn,sv,th,tr,tt,ug,uk,vi,zh,zh-cn",icons:"button,checkbox,form,hiddenfield,imagebutton,radio,select,select-rtl,textarea,textarea-rtl,textfield",hidpi:!0,onLoad:function(){CKEDITOR.addCss(".cke_editable form{border: 1px dotted #FF0000;padding: 2px;}\n");
CKEDITOR.addCss("img.cke_hidden{background-image: url("+CKEDITOR.getUrl(this.path+"images/hiddenfield.gif")+");background-position: center center;background-repeat: no-repeat;border: 1px solid #a9a9a9;width: 16px !important;height: 16px !important;}")},init:function(a){var b=a.lang,g=0,h={email:1,password:1,search:1,tel:1,text:1,url:1},l={checkbox:"input[type,name,checked,required]",radio:"input[type,name,checked,required]",textfield:"input[type,name,value,size,maxlength,required]",textarea:"textarea[cols,rows,name,required]",
select:"select[name,size,multiple,required]; option[value,selected]",button:"input[type,name,value]",form:"form[action,name,id,enctype,target,method]",hiddenfield:"input[type,name,value]",imagebutton:"input[type,alt,src]{width,height,border,border-width,border-style,margin,float}"},m={checkbox:"input",radio:"input",textfield:"input",textarea:"textarea",select:"select",button:"input",form:"form",hiddenfield:"input",imagebutton:"input"},e=function(d,c,e){var h={allowedContent:l[c],requiredContent:m[c]};
"form"==c&&(h.context="form");a.addCommand(c,new CKEDITOR.dialogCommand(c,h));a.ui.addButton&&a.ui.addButton(d,{label:b.common[d.charAt(0).toLowerCase()+d.slice(1)],command:c,toolbar:"newsManager,"+(g+=10)});CKEDITOR.dialog.add(c,e)},f=this.path+"dialogs/";!a.blockless&&e("Form","form",f+"form.js");e("Checkbox","checkbox",f+"checkbox.js");e("Radio","radio",f+"radio.js");e("TextField","textfield",f+"textfield.js");e("Textarea","textarea",f+"textarea.js");e("Select","select",f+"select.js");e("Button","button",
f+"button.js");var k=a.plugins.image;k&&!a.plugins.image2&&e("ImageButton","imagebutton",CKEDITOR.plugins.getPath("image")+"dialogs/image.js");e("HiddenField","hiddenfield",f+"hiddenfield.js");a.addMenuItems&&(e={checkbox:{label:b.forms.checkboxAndRadio.checkboxTitle,command:"checkbox",group:"checkbox"},radio:{label:b.forms.checkboxAndRadio.radioTitle,command:"radio",group:"radio"},textfield:{label:b.forms.textfield.title,command:"textfield",group:"textfield"},hiddenfield:{label:b.forms.hidden.title,
command:"hiddenfield",group:"hiddenfield"},button:{label:b.forms.button.title,command:"button",group:"button"},select:{label:b.forms.select.title,command:"select",group:"select"},textarea:{label:b.forms.textarea.title,command:"textarea",group:"textarea"}},k&&(e.imagebutton={label:b.image.titleButton,command:"imagebutton",group:"imagebutton"}),!a.blockless&&(e.form={label:b.forms.form.menu,command:"form",group:"form"}),a.addMenuItems(e));a.contextMenu&&(!a.blockless&&a.contextMenu.addListener(function(d,
c,a){if((d=a.contains("form",1))&&!d.isReadOnly())return{form:CKEDITOR.TRISTATE_OFF}}),a.contextMenu.addListener(function(d){if(d&&!d.isReadOnly()){var c=d.getName();if("select"==c)return{select:CKEDITOR.TRISTATE_OFF};if("textarea"==c)return{textarea:CKEDITOR.TRISTATE_OFF};if("input"==c){var a=d.getAttribute("type")||"text";switch(a){case "button":case "submit":case "reset":return{button:CKEDITOR.TRISTATE_OFF};case "checkbox":return{checkbox:CKEDITOR.TRISTATE_OFF};case "radio":return{radio:CKEDITOR.TRISTATE_OFF};
case "image":return k?{imagebutton:CKEDITOR.TRISTATE_OFF}:null}if(h[a])return{textfield:CKEDITOR.TRISTATE_OFF}}if("img"==c&&"hiddenfield"==d.data("cke-real-element-type"))return{hiddenfield:CKEDITOR.TRISTATE_OFF}}}));a.on("doubleclick",function(d){var c=d.data.element;if(!a.blockless&&c.is("form"))d.data.dialog="form";else if(c.is("select"))d.data.dialog="select";else if(c.is("textarea"))d.data.dialog="textarea";else if(c.is("img")&&"hiddenfield"==c.data("cke-real-element-type"))d.data.dialog="hiddenfield";
else if(c.is("input")){c=c.getAttribute("type")||"text";switch(c){case "button":case "submit":case "reset":d.data.dialog="button";break;case "checkbox":d.data.dialog="checkbox";break;case "radio":d.data.dialog="radio";break;case "image":d.data.dialog="imagebutton"}h[c]&&(d.data.dialog="textfield")}})},afterInit:function(a){var b=a.dataProcessor,g=b&&b.htmlFilter,b=b&&b.dataFilter;CKEDITOR.env.ie&&g&&g.addRules({elements:{input:function(a){a=a.attributes;var b=a.type;b||(a.type="text");"checkbox"!=
b&&"radio"!=b||"on"!=a.value||delete a.value}}},{applyToAll:!0});b&&b.addRules({elements:{input:function(b){if("hidden"==b.attributes.type)return a.createFakeParserElement(b,"cke_hidden","hiddenfield")}}},{applyToAll:!0})}});