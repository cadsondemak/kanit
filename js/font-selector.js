// Font switcher
function fontSelector(){
  fontselector = document.getElementById('font-selector');
  fontcanvas = document.getElementsByTagName('body')[0];
  fontclass = fontselector.options[fontselector.selectedIndex].value;
  fontcanvas.className = '';
  fontcanvas.className = fontclass;
}
