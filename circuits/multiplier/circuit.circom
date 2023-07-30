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

    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    notGate.in <== b;
    y <== notGate.out;

    orGate.a <== x;
    orGate.b <== y;
    q <== andGate.out;

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
