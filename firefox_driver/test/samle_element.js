var get_image = function(x,y,width,height,path){
  var nilal_element = document.getElementById,s('nilal_client');
  if (nilal_element == null){
    nilal_element = document.createElement('nilal_client');
    nilal_element.id = 'nilal_client';
  }
  nilal_element.setAttribute('x', x);
  nilal_element.setAttribute('y', y);
  nilal_element.setAttribute('width', width);
  nilal_element.setAttribute('height',height );
  nilal_element.setAttribute('path', path);
  document.documentElement.appendChild(nilal_element);
  var CatchNilal = new CustomEvent('CatchNilal',true,false);
}
