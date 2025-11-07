let isPaused = false;

let speed = 1.0;
let currentSpeed=  1.0;



script.setSpeed = (inputSpeed) => {
//    currentSpeed = inputSpeed;
//    speed = inputSpeed;

    print(inputSpeed)
}


script.doPause = () => {
    isPaused = !isPaused;

    print(isPaused)
}
