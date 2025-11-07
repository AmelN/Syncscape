/**
 * SimpleCircleAreaInstantiator (Circle Ring)
 * Instantiates prefabs evenly spaced around a circle on the XZ plane (Y-up).
 */

//@input SceneObject center {"hint":"Center of the circle area"}
//@input Asset.ObjectPrefab prefab {"hint":"Prefab to instantiate"}
//@input int numberOfPrefabs = 10 {"hint":"Number of prefabs to instantiate"}
//@input float radius = 5.0 {"hint":"Radius of the circle"}

// @input Component.ScriptComponent audioLevelsScript

var tubeArray = [];
var rtb;

function SimpleCircleRingInstantiator(radius) {
    script.createEvent("OnStartEvent").bind(onStart);

    function onStart() {
        instantiatePrefabsOnCircle();
    }

    function instantiatePrefabsOnCircle() {
        if (!script.prefab) {
            print("Error: Prefab not assigned!");
            return;
        }

        // Center around the user/device: use the script's SceneObject (attach to Camera)
        var parentSO = script.getSceneObject();
        var centerPos = parentSO.getTransform().getWorldPosition();

        var count = Math.max(0, script.numberOfPrefabs | 0);
        if (count === 0) {
            return;
        }

        var twoPi = Math.PI * 2.0;
        for (var i = 0; i < count; i++) {
            var t = i / count;
            var angle = t * twoPi; // radians

            // Place on horizontal circle (XZ plane), Y-up
            var x = centerPos.x + Math.cos(angle) * radius;
            var y = centerPos.y;
            var z = centerPos.z + Math.sin(angle) * radius;
            var pos = new vec3(x, y, z);

            createPrefabInstance(parentSO, pos);
        }
    }

    function createPrefabInstance(parentSO, worldPos) {
        var instance = script.prefab.instantiate(parentSO);
        rts = instance.getTransform().getWorldScale()
        tubeArray.push(instance)
        if (!instance) {
            print("Error: Failed to instantiate prefab");
            return;
        }
        instance.getTransform().setWorldPosition(worldPos);
    }
}

script.SimpleCircleRingInstantiator = SimpleCircleRingInstantiator;
SimpleCircleRingInstantiator(100);
SimpleCircleRingInstantiator(200);
SimpleCircleRingInstantiator(300);
SimpleCircleRingInstantiator(400);
SimpleCircleRingInstantiator(500);


script.createEvent("UpdateEvent").bind(onUpdate);

function onUpdate()
{
    var rtb = script.audioLevelsScript.getBandsFloatArray()

    for (var i = 0; i < 8; i++) {
        tubeArray[i].getTransform().setLocalScale(new vec3(rts.x, rtb[3] * rts.y, rts.z))
//        tubeArray[i].getTransform().setWorldScale(rts)
    }

    for (var i = 0; i < 8; i++) {
        tubeArray[i + 8].getTransform().setLocalScale(new vec3(rts.x, rtb[4] * rts.y, rts.z))
//        tubeArray[i].getTransform().setWorldScale(rts)
    }
    for (var i = 0; i < 8; i++) {
        tubeArray[i + 16].getTransform().setLocalScale(new vec3(rts.x, rtb[5] * rts.y, rts.z))
//        tubeArray[i].getTransform().setWorldScale(rts)
    }

    for (var i = 0; i < 8; i++) {
        tubeArray[i + 24].getTransform().setLocalScale(new vec3(rts.x, rtb[6] * rts.y, rts.z))
//        tubeArray[i].getTransform().setWorldScale(rts)
    }

    for (var i = 0; i < 8; i++) {
        tubeArray[i + 32].getTransform().setLocalScale(new vec3(rts.x, rtb[7] * rts.y, rts.z))
//        tubeArray[i].getTransform().setWorldScale(rts)
    }
 
}