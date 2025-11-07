// @input Asset.RenderMeshVisual myRmv

// @input SceneObject outObject

//const SyncKitLogger = require("SpectaclesSyncKit.lspkg/Utils/SyncKitLogger").SyncKitLogger;
const SyncKitLogger = require("../../Utils/SyncKitLogger").SyncKitLogger;
const HSLToRGB = require("SpectaclesInteractionKit.lspkg/Utils/color").HSLToRGB;

// The speed at which the hue changes
const COLOR_CHANGE_SPEED = 30;

const log = new SyncKitLogger("ColorStoragePropertyExampleJavascript");

let myPropRmv = null;
let myStoragePropertySet = null;
let syncEntity = null;

let myColorA = new vec4(1,1,1,1);

function onStart() {
  myPropRmv = StorageProperty.forMeshVisualBaseColor(script.myRmv, true);
  myStoragePropertySet = new StoragePropertySet([myPropRmv]);
  syncEntity = new SyncEntity(script, myStoragePropertySet, true);

  script.createEvent("UpdateEvent").bind(updateColor);
}


let init = false;


function updateColor() {
  
  if (!syncEntity.doIOwnStore()) {
//    log.i("Not the syncEntity owner, not changing anything.");
    if(!init) {
      myPropRmv.onAnyChange.add((newValue, oldValue) => {
    //    print('Current value changed from ' + oldValue + ' to ' + newValue);
        if (newValue) {

          if (!syncEntity.doIOwnStore()) {
              script.myRmv.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
//              script.outObject.getTransform().setWorldScale(new vec3(10 * newValue.x, 10 * newValue.y+1, 10));
//              script.outObject.mainMaterial.mainPass.baseColor = new vec4(newValue.x, newValue.y, newValue.z, 1);
          }
        }
      }); 
      init = true;     
    }

    return;
  }

//  const numChars = getTime() * COLOR_CHANGE_SPEED;
//  const newColor = HSLToRGB(new vec3(numChars % 360, 1, 0.5));
  script.myRmv.mainMaterial.mainPass.baseColor = myColorA; //new vec4(newColor.x, newColor.y, newColor.z, 1);

  print(myColorA)
}

const onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);






// callbacks from djbooth sliders

let isPaused = false;

let speed = 1.0;
let currentSpeed=  1.0;



script.setSlider1 = (inValue) => {
  if (syncEntity.doIOwnStore()) {
    myColorA.x = inValue/2;
  }

//    print(inValue)
}

script.setSlider2 = (inValue) => {
  if (syncEntity.doIOwnStore()) {
    myColorA.y = inValue/2;
  }
//    print(inValue)
}

script.setSlider3 = (inValue) => {
  if (syncEntity.doIOwnStore()) {
    myColorA.z = inValue/2;
  }
//    print(inValue)
}


script.doPause = () => {
    isPaused = !isPaused;

    print(isPaused)
}
