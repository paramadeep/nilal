var CC = Components.classes;
var CI = Components.interfaces;
var CR = Components.results;
var CU = Components.utils;


var nilal = {
  grab : function(x,y,width,height,window) {
    var document = window.document;
     var documentElement = document.documentElement;
    var canvas = document.getElementById('screenshot-canvas');
    if (canvas == null) {
      canvas = document.createElement('canvas');
      canvas.id = 'screenshot-canvas';
      canvas.style.display = 'none';
      documentElement.appendChild(canvas);
    }

    canvas.width = width;
    canvas.height = height;

    try {
      var context = canvas.getContext('2d');
    } catch (e) {
      throw new Error('Unable to get context - ' + e);
    }
    try {
      context.drawWindow(window, x, y, width, height, 'rgb(255,255,255)');
      context.imageSmoothingEnabled = false;
    } catch (e) {
      throw new Error('Unable to draw window - ' + e);
    }

    return canvas;
  },

  save : function(canvas, filepath) {
    var dataUrl = canvas.toDataURL('image/png');
    var ioService = CC['@mozilla.org/network/io-service;1'].
      getService(CI['nsIIOService']);
    var dataUri = ioService.newURI(dataUrl, 'UTF-8', null);
    var channel = ioService.newChannelFromURI(dataUri);
    var file = CC['@mozilla.org/file/local;1'].createInstance(CI['nsILocalFile']);
    file.initWithPath(filepath);
    var inputStream = channel.open();
    var binaryInputStream = CC['@mozilla.org/binaryinputstream;1'].
      createInstance(CI['nsIBinaryInputStream']);
    binaryInputStream.setInputStream(inputStream);
    var fileOutputStream = CC['@mozilla.org/network/safe-file-output-stream;1'].
      createInstance(CI['nsIFileOutputStream']);
    fileOutputStream.init(file, -1, -1, null);
    var n = binaryInputStream.available();
    var bytes = binaryInputStream.readBytes(n);
    fileOutputStream.write(bytes, n);
    if (fileOutputStream instanceof CI['nsISafeOutputStream']) {
      fileOutputStream.finish();
    } else {
      fileOutputStream.close();
    }

  },

  catch_screen : function(evt){
    var element = evt.target;
    var x = element.getAttribute("x");
    var y = element.getAttribute("y");
    var width = element.getAttribute("width");
    var height = element.getAttribute("height");
    var path = element.getAttribute("path");
    var canvas = nilal.grab(x,y,width,height,element.ownerDocument.defaultView);
    nilal.save(canvas,path); 
  }
};

document.addEventListener("CatchNilal", function(evt) { nilal.catch_screen(evt); }, false, true);
