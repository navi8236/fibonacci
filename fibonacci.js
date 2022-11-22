let fib = [0, 1];

let iterations = 5;
let currentIteration = 0;
while (currentIteration <= iterations) {
    console.log(currentIteration);

    fib.push(fib[currentIteration] + fib[currentIteration + 1]);
    currentIteration++;
}
console.log(fib);