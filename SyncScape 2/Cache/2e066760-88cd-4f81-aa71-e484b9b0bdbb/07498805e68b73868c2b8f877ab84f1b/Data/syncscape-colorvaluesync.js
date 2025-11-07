// @input Component.Text isVJText
// @input Component.ScriptComponent[] vjOnlyInteractibles

// @input Asset.Material holoMat
// @input Asset.Material cylinderMat
// @input Component.VFXComponent vfx

let isVJText = script.isVJText;
let vjOnlyInteractibles = script.vjOnlyInteractibles;

let daVJ = false;

const sessionController = global.sessionController;


var StartFlow = script.createEvent('DelayedCallbackEvent');
StartFlow.bind(function (eventData)
{
    sessionController.notifyOnReady(() =>
    {
        print("Session Started");
        // SessionController is ready to use
        CheckIfUserIsVJ();
    });
});

// Get a proper entry for start flow at some point
StartFlow.reset(0);


function CheckIfUserIsVJ()
{
    print("Checking if we are VJ");
    let userList = sessionController.getUsers();

    print("UL: " + userList.length);

    if (userList.length == 1)
    {
        HandleUserIsVJ();
        daVJ = true;
    } else
    {
        daVJ = false;
        HandleUserIsNotVJ();
    }

    onStart();
}


function HandleUserIsVJ()
{
    print("I AM VJ");
    isVJText.text = "VJ";
    for (let i = 0; i < vjOnlyInteractibles.length; i++)
    {
        vjOnlyInteractibles[i].enabled = true;
    }
}


function HandleUserIsNotVJ()
{
    print("I AM NOT VJ");
    isVJText.text = "NOT VJ";

}




// @input Asset.RenderMeshVisual myRmv
// @input Asset.RenderMeshVisual myRmvB
// @input Asset.RenderMeshVisual myRmvC

// @input Asset.RenderMeshVisual outObject

//const SyncKitLogger = require("SpectaclesSyncKit.lspkg/Utils/SyncKitLogger").SyncKitLogger;
const SyncKitLogger = require("../../Utils/SyncKitLogger").SyncKitLogger;
const HSLToRGB = require("SpectaclesInteractionKit.lspkg/Utils/color").HSLToRGB;

// The speed at which the hue changes
const COLOR_CHANGE_SPEED = 30;

const log = new SyncKitLogger("ColorStoragePropertyExampleJavascript");

let myPropRmvA = null;
let myStoragePropertySetA = null;
let syncEntityA = null;

let myPropRmvB = null;
let myStoragePropertySetB = null;
let syncEntityB = null;

let myPropRmvC = null;
let myStoragePropertySetC = null;
let syncEntityC = null;

let myColorA = new vec4(0,0,0,1);
let myColorB = new vec4(0,0,0,1);
let myColorC = new vec4(0,0,0,1);

function onStart() {
  myPropRmvA = StorageProperty.forMeshVisualBaseColor(script.myRmv, true);
  myStoragePropertySetA = new StoragePropertySet([myPropRmvA]);
  syncEntityA = new SyncEntity(script, myStoragePropertySetA, true);

  myPropRmvB = StorageProperty.forMeshVisualBaseColor(script.myRmvB, true);
  myStoragePropertySetB = new StoragePropertySet([myPropRmvB]);
  syncEntityB = new SyncEntity(script, myStoragePropertySetB, true);

  myPropRmvC = StorageProperty.forMeshVisualBaseColor(script.myRmvC, true);
  myStoragePropertySetC = new StoragePropertySet([myPropRmvC]);
  syncEntityC = new SyncEntity(script, myStoragePropertySetC, true);

  script.createEvent("UpdateEvent").bind(updateColor);

  myPropRmvA.onAnyChange.add((newValue, oldValue) => {
//    print('Current value changed from ' + oldValue + ' to ' + newValue);
        if (newValue) {

          if (!daVJ) {
//              script.myRmv.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
//              script.outObject.getTransform().setWorldScale(new vec3(10 * newValue.x, 10 * newValue.y+1, 10));
              script.outObject.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
              script.holoMat.mainPass.rimTint = newValue;
          }
        }
  }); 

myPropRmvB.onAnyChange.add((newValue, oldValue) => {
//    print('Current value changed from ' + oldValue + ' to ' + newValue);
        if (newValue) {

          if (!daVJ) {
//              script.myRmv.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
//              script.outObject.getTransform().setWorldScale(new vec3(10 * newValue.x, 10 * newValue.y+1, 10));
              script.outObject.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
              script.holoMat.mainPass.rimTint = newValue;
          }
        }
  }); 

myPropRmvC.onAnyChange.add((newValue, oldValue) => {
//    print('Current value changed from ' + oldValue + ' to ' + newValue);
        if (newValue) {

          if (!daVJ) {
//              script.myRmv.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
//              script.outObject.getTransform().setWorldScale(new vec3(10 * newValue.x, 10 * newValue.y+1, 10));
              script.outObject.mainMaterial.mainPass.baseColor = new vec4(1-newValue.x, 1-newValue.y, 1-newValue.z, 1);
              script.holoMat.mainPass.rimTint = newValue;
          }
        }
  }); 
}


function updateColor() {
  
//  if (!syncEntity.doIOwnStore()) {
  if (!daVJ) {
//    log.i("Not the syncEntity owner, not changing anything.");
    return;
  }

//  const numChars = getTime() * COLOR_CHANGE_SPEED;
//  const newColor = HSLToRGB(new vec3(numChars % 360, 1, 0.5));
  script.myRmv.mainMaterial.mainPass.baseColor = myColorA; //new vec4(newColor.x, newColor.y, newColor.z, 1);
  script.myRmvB.mainMaterial.mainPass.baseColor = myColorB; //new vec4(newColor.x, newColor.y, newColor.z, 1);
  script.myRmvC.mainMaterial.mainPass.baseColor = myColorC; //new vec4(newColor.x, newColor.y, newColor.z, 1);
  script.outObject.mainMaterial.mainPass.baseColor = new vec4(myColorA.x, myColorA.y, myColorA.z, 1);
              script.holoMat.mainPass.rimTint = myColorA;

  script.cylinderMat.mainPass.baseColor = myColorB;
  script.vfx.properties.partColor = myColorc;

//  print(myColorA)
}

//const onStartEvent = script.createEvent("OnStartEvent");
//onStartEvent.bind(onStart);






// callbacks from djbooth sliders

let isPaused = false;

let speed = 1.0;
let currentSpeed=  1.0;



script.setSlider1 = (inValue) => {
  if (daVJ) {
    myColorA.x = inValue;
  }

//    print(inValue)
}

script.setSlider2 = (inValue) => {
  if (daVJ) {
    myColorA.y = inValue;
  }
//    print(inValue)
}

script.setSlider3 = (inValue) => {
  if (daVJ) {
    myColorA.z = inValue;
  }
//    print(inValue)
}


script.setSliderL1 = (inValue) => {
  if (daVJ) {
    myColorB.x = inValue;
  }

//    print(inValue)
}

script.setSliderL2 = (inValue) => {
  if (daVJ) {
    myColorB.y = inValue;
  }
//    print(inValue)
}

script.setSliderL3 = (inValue) => {
  if (daVJ) {
    myColorB.z = inValue;
  }
//    print(inValue)
}


script.setSliderR1 = (inValue) => {
  if (daVJ) {
    myColorC.x = inValue;
  }

//    print(inValue)
}

script.setSliderR2 = (inValue) => {
  if (daVJ) {
    myColorC.y = inValue;
  }
//    print(inValue)
}

script.setSliderR3 = (inValue) => {
  if (daVJ) {
    myColorC.z = inValue;
  }
//    print(inValue)
}


script.doPause = () => {
    isPaused = !isPaused;

    print(isPaused)
}
