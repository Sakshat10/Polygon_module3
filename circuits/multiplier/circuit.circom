pragma circom 2.0.0;

template MyCircuit () {
    signal input a;
    signal input b;
    signal x;
    signal y;
    signal output q;

    component orGate = OR();
    component andGate = AND();
    component notGate = NOT();

    orGate.a <== a;
    orGate.b <== b;
    x <== orGate.out;

    andGate.a <== x;
    andGate.b <== b;
    y <== andGate.out;

    notGate.in <== y;
    q <== notGate.out;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in;
}

component main = MyCircuit();
