const readline = require("readline");

function prompt(question, callback) {
    let val;
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });

    rl.question(question, (answer) => {
        rl.close();
        // return callback(answer);
        return answer;
    });
    return val;
}

const val = prompt("Enter a value: ", (val) => {
    console.log({ val });
});
console.log({ val });
