let player =0
let computer =0

let images = ["ROCK.png", "PAPER.png", "SCISSORS.png"]

function player_choice (num){
    player = num
    document.getElementById("player").src = images[num]
    computer_choice()
}

function computer_choice (){
    let r = Math.random() *3
    computer = Math.floor(r)
    document.getElementById("computer").src = images[computer]

    result()
}

function result(){
    if(player == computer){
        document.getElementById("result").innerHTML = "It's a tie!"
    } 
    else if(player == 0 && computer == 2){
        document.getElementById("result").innerHTML = "You win!"
    } 
    else if(player == 1 && computer == 0){
        document.getElementById("result").innerHTML = "You win!"
    }
    else if(player == 2 && computer == 1){
        document.getElementById("result").innerHTML = "You win!"
    }
    else{
        document.getElementById("result").innerHTML = "You lose!"
    }
}
