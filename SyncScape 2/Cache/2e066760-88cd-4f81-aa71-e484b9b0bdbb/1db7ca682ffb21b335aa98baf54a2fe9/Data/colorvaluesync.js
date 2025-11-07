// @input Component.Text isVJText
// @input Component.ScriptComponent[] vjOnlyInteractibles

// @input Asset.Material holoMat

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

// @input Asset.RenderMeshVisual outObject

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
  
//  if (!syncEntity.doIOwnStore()) {
  if (!daVJ) {
//    log.i("Not the syncEntity owner, not changing anything.");
    if(!init) {
      myPropRmv.onAnyChange.add((newValue, oldValue) => {
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
      init = true;     
    }

    return;
  }

//  const numChars = getTime() * COLOR_CHANGE_SPEED;
//  const newColor = HSLToRGB(new vec3(numChars % 360, 1, 0.5));
  script.myRmv.mainMaterial.mainPass.baseColor = myColorA; //new vec4(newColor.x, newColor.y, newColor.z, 1);
  script.outObject.mainMaterial.mainPass.baseColor = new vec4(myColorA.x, myColorA.y, myColorA.z, 1);
              script.holoMat.mainPass.rimTint = myColorA;

  print(myColorA)
}

//const onStartEvent = script.createEvent("OnStartEvent");
//onStartEvent.bind(onStart);






// callbacks from djbooth sliders

let isPaused = false;

let speed = 1.0;
let currentSpeed=  1.0;



script.setSlider1 = (inValue) => {
  if (daVJ) {
    myColorA.x = inValue/2;
  }

//    print(inValue)
}

script.setSlider2 = (inValue) => {
  if (daVJ) {
    myColorA.y = inValue/2;
  }
//    print(inValue)
}

script.setSlider3 = (inValue) => {
  if (daVJ) {
    myColorA.z = inValue/2;
  }
//    print(inValue)
}


script.doPause = () => {
    isPaused = !isPaused;

    print(isPaused)
}
