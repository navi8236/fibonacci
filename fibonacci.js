let fib = [0, 1];

let iterations = 10;
let currentIteration = 0;
while (currentIteration < iterations) {
    fib.push(fib[currentIteration] + fib[currentIteration + 1]);
    currentIteration++;
}
console.log(fib);