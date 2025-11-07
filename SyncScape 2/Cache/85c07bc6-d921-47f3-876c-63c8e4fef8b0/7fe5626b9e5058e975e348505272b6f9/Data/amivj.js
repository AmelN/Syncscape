// @input Component.Text isVJText
// @input Component.ScriptComponent[] vjOnlyInteractibles

let isVJText = script.isVJText;
let vjOnlyInteractibles = script.vjOnlyInteractibles;


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
    } else
    {
        HandleUserIsNotVJ();
    }
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