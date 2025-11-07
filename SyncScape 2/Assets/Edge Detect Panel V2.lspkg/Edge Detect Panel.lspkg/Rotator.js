//@input Asset.Texture screenCropTexture
// @input float rotationpeed


let screenCropTextureControl = script.screenCropTexture.control;


let currentRotation = 0;
let rotationSpeed = script.rotationpeed;


var Update = script.createEvent('UpdateEvent');
Update.bind(function (eventData)
{
    currentRotation += rotationSpeed * getDeltaTime();
    screenCropTextureControl.rotation = currentRotation;
});